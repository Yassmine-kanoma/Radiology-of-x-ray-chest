import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitialState());


  TextEditingController emailController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  var formKey = GlobalKey<FormState>();

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);


  Future<void> resetPassword() async {
    emit(ForgotPasswordLoadingState());
    try {
      await firebaseAuth.sendPasswordResetEmail(email: emailController.text);
      emit(ForgotPasswordSuccessState('Check Your Email'));
    } on FirebaseException catch (error) {
      emit(ForgotPasswordFailureState(error.message.toString()));
    } catch (error) {
      emit(ForgotPasswordFailureState(error.toString()));
    }
  }
}
