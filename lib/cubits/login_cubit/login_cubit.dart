import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/login_cubit/login_state.dart';
import 'package:yassmineee/models/user_model.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  late User user;

  late UserModel userModel;

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoadingState());
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text))
          .user;
      this.user=user!;
      DocumentSnapshot<Map<String, dynamic>> users =
      await firebaseFirestore.collection('Users').doc(user.uid).get();
      userModel = UserModel.fromJson(users.data()!);
      emit(LoginSuccessState(user));
    } on FirebaseException catch (error) {
      emit(LoginFailureState(error.message.toString()));
    } catch (error) {
      emit(LoginFailureState(error.toString()));
    }
  }

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }


}
