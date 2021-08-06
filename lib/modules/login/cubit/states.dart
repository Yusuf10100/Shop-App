import 'package:shop_app/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class AppChangeThemeState extends LoginStates {}

///Login Page States
class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState({
    this.error,
  });
}

class SuffixIconPassChange extends LoginStates {}
