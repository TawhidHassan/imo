import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../main_screen.dart';


class SpalashScreen extends StatefulWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  _SpalashScreenState createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  double _textOpacity = 0.0;
  bool isLogin=false;
  LocalDataGet _localDataGet=new LocalDataGet();
  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    Timer(Duration(seconds: 4), () {
      setState(() {
        isLogin?
        Navigator.pushReplacement(context, PageTransition(MainScreen())): Navigator.pushReplacementNamed(
            context, LOGIN_PAGE);
        // isLogin?
        // Navigator.pushReplacement(context, PageTransition(MainScreen())):Navigator.pushReplacement(context, PageTransition(MainScreen()));
      });
    });

    super.initState();
  }
  void checkLogin() async {
    var token=await _localDataGet.getData();

    if (token.get('token') != null) {
      setState(() {
        isLogin=true;

      });
    } else {
      setState(() {
        isLogin=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
            height: 1.0.sh,
            width: 1.0.sw,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.message)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Powered By",style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                )
              ],
            )

        )
    );
  }


}

class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition(this.page) : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}