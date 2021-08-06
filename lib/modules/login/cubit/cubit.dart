import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(
      context); //to make it easy call object from bloc globally anywhere

  LoginModel loginModel;

  ///login cubit for loading,success and error of login screen
  void loginScreen({
    @required String email,
    @required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper().postData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError(
      (error) {
        emit(LoginErrorState(error: error.toString()));
        print(error.toString());
      },
    );
    
  }

  /* bloc implementation for changing the suffix icon of password text field 
  when pressed to swap between two icons and make the password obscure*/
  bool isPassword = true;
  void passwordSuffixChange() {
    isPassword = !isPassword;
    emit(SuffixIconPassChange());
  }

  // bloc implementation for changing between dark and light themes:
  bool isDark = true;
  void changeAppThemeMode() {
    isDark = !isDark;
    emit(AppChangeThemeState());
  }
}
