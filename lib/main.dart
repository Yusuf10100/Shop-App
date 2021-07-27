import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/modules/login/login_screen.dart';

import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/%20cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles.dart/themes.dart';

import 'modules/onBoarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //make sure initializing everything before running the app
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getSavedData(key: 'onBoarding');
  String token = CacheHelper.getSavedData(key: 'token');

  Widget startWidget() {
    if (onBoarding != null) {
      if (token != null) {
        return HomeLayout();
      } else {
        return LoginScreen();
      }
    } else {
      return OnBoardingScreen();
    }
  }

  runApp(MyApp(
    onBoarding: onBoarding,
    widget: startWidget(),
  ));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  final Widget widget;
  MyApp({
    this.onBoarding, this.widget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit()..changeAppThemeMode(),
          ),
          BlocProvider(
            create: (context) => ShopCubit()..getHomeData(),
          ),
        ],
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: LoginCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: widget,
            );
          },
        ));
  }
}
