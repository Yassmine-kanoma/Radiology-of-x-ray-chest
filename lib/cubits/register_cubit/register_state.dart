import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final User user;

  RegisterSuccessState(this.user);
}

class RegisterFailureState extends RegisterState {
  final String error;

  RegisterFailureState(this.error);
}


class RegisterChangePasswordVisibilityState extends RegisterState {}
class SaveDataLoadingState extends RegisterState {}

class SaveDataSuccessState extends RegisterState {
  final String message;

  SaveDataSuccessState( this.message);
}

class SaveDataFailureState extends RegisterState {
  final String error;

  SaveDataFailureState(this.error);
}