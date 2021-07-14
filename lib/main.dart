import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/bloc_observer.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/styles.dart/themes.dart';

import 'modules/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //make sure initializing everything before running the app
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit()..changeAppThemeMode(),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: OnBoardingScreen(),
            );
          },
        ));
  }
}
