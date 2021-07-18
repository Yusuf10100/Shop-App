import 'package:shop_app/models/login_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeThemeState extends AppStates {}

///Login Page States
class LoginSuccessState extends AppStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends AppStates {}

class LoginErrorState extends AppStates {
  String error;
  LoginErrorState({
    this.error,
  });
}

class SuffixIconPassChange extends AppStates {}
