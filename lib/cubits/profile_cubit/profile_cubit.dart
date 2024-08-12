import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_state.dart';
import 'package:yassmineee/models/user_model.dart';
import 'package:yassmineee/utils/app_constants.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  var formKey = GlobalKey<FormState>();

  static ProfileCubit get(context) => BlocProvider.of(context);

  late UserModel userModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    try {
      DocumentSnapshot<Map<String, dynamic>> result = await firebaseFirestore
          .collection('Users')
          .doc(AppConstants.userId)
          .get();
      UserModel user = UserModel.fromJson(result.data()!);
      userModel = user;
      emit(GetUserDataSuccessState(user));
    } on FirebaseException catch (error) {
      emit(GetUserDataFailureState(error.message.toString()));
    } catch (error) {
      emit(GetUserDataFailureState(error.toString()));
    }
  }

  Future<void> updateUserData() async {
    emit(UpdateUserDataLoadingState());
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(AppConstants.userId)
          .update({
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'phone': phoneNameController.text,
        'gender': genderController.text,
      });
      getUserData();
      emit(
          UpdateUserDataSuccessState('The data has been updated successfully'));
    } on FirebaseException catch (error) {
      emit(UpdateUserDataFailureState(error.message.toString()));
    } catch (error) {
      emit(UpdateUserDataFailureState(error.toString()));
    }
  }


  Future<void> uploadImage({required File file})async{
    emit(UploadImageLoadingState());
    try {
      print('1');
      final Reference reference =  FirebaseStorage.instance.ref(AppConstants.userId);
      print('2');
      await reference.putFile(file);
      print('3');
      String url = await reference.getDownloadURL();
      print('4');
      await firebaseFirestore
          .collection('Users')
          .doc(AppConstants.userId)
          .update({
        'image': url,
      });
      getUserData();
      emit(
          UploadImageSuccessState('Picture has been updated'));
    } on FirebaseException catch (error) {
      print(error.toString());
      print(error.toString());
      print(error.toString());
      emit(UploadImageFailureState(error.message.toString()));
    } catch (error) {
      print(error.toString()); print(error.toString());
      emit(UploadImageFailureState(error.toString()));
    }
  }

}
