import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context); //to make it easy call object from bloc globally anywhere

// bloc implementation for changing between dark and light themes:
  bool isDark = true;
  void changeAppThemeMode() {
    isDark = !isDark;
    emit(AppChangeThemeState());
  }






}
