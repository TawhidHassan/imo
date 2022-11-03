import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:imo/Bloc/Login/login_cubit.dart';
import 'package:imo/Presentation/Pages/HomePage/home_page.dart';
import 'package:imo/Presentation/main_screen.dart';

import '../Bloc/User/user_cubit.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Pages/LogInPage/login_page.dart';
import '../Presentation/Pages/SplashScreen/splash_page.dart';


class AppRouter {
  final Box? box;

  AppRouter({this.box});

  Route? generateRoute(RouteSettings settings) {
    // final ScreenArguments? arguments = settings.arguments as ScreenArguments;
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SpalashScreen());
      case MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ));

      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());


      default:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                BlocProvider<UserCubit>(
                  create: (context) => UserCubit(),
                  child: HomePage(),
                ));
    }
  }
}
