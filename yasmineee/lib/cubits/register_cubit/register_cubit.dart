import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/register_cubit/register_state.dart';
import 'package:yassmineee/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  Future<void> registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text))
          .user;
      await saveUserDataToFirebase(
          userModel: UserModel(
        uid: user!.uid,
        email: user.email!,
            address: addressNameController.text,
        phone: phoneNameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
      ));
      emit(RegisterSuccessState(user));
    } on FirebaseException catch (error) {
      emit(RegisterFailureState(error.message.toString()));
    } catch (error) {
      return emit(RegisterFailureState(error.toString()));
    }
  }

  Future<void> saveUserDataToFirebase({
    required UserModel userModel,
  }) async {
    emit(SaveDataLoadingState());
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(userModel.uid)
          .set(userModel.toJson());
      emit(SaveDataFailureState('Data Saved Successfully'));
    } on FirebaseException catch (error) {
      emit(RegisterFailureState(error.message.toString()));
    } catch (error) {
      emit(SaveDataFailureState(error.toString()));
    }
  }

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }
}
