import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Bloc/User/user_cubit.dart';
import 'Constants/Colors/app_colors.dart';
import 'Route/app_route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  var databasePath = await getApplicationSupportDirectory();
  Hive.init(databasePath.path);
  Box? box= await Hive.openBox('users');
  runApp( MyApp(router: AppRouter(box: box)));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key? key, required this.router}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),

      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Imo',
              theme: ThemeData(
                  primaryColor: kPrimaryColorx,
                  fontFamily: "MavenPro"
              ),
              onGenerateRoute: router.generateRoute,
            );
          }),
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}