import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:imo/Presentation/Pages/HomePage/home_page.dart';

import '../Bloc/User/user_cubit.dart';
import '../Constants/Strings/app_strings.dart';


class AppRouter {
  final Box? isar;

  AppRouter({this.isar});

  Route? generateRoute(RouteSettings settings) {
    // final ScreenArguments? arguments = settings.arguments as ScreenArguments;
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());

    case HOME_PAGE:
      return MaterialPageRoute(builder: (_) => HomePage());


      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider<UserCubit>(
              create: (context) => UserCubit(),
              child: HomePage(),
            ));
    }
  }
}