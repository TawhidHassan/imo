import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:imo/Config/text_style.dart';

import '../../../Bloc/Login/login_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import '../../main_screen.dart';
import '../SplashScreen/splash_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? countryValue;
  final countryList = [
    "Bangladesh",
    "India",
    "Pakistan",
    "Srilanka",
  ];
  TextEditingController phoneTextController=new TextEditingController();
  bool? isloading=false;
  final _globalkey = GlobalKey<FormState>();
  Box? users;
  //storage instance
  LoginDataSave? loginDataSave;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users =Hive.box('users');
    loginDataSave=LoginDataSave();
  }


  void addData({Box? users,String? name, String? role, String? image, String? userid, String? token, String? phoneNumber,})async{

    loginDataSave!.storeTokenUserdata(users: users,token: token,id:  userid,name:  name,role:  role,image: image,phone: phoneNumber);
    Navigator.pushReplacementNamed(context, MAIN_PAGE);

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginUser){
          setState(() {
            isloading=false;
          });
          final data=(state as LoginUser).login;
          addData(
              users: users,
              image: data!.user!.image,
              name: data.user!.name,
              phoneNumber:data.user!.phoneNumber ,
              role: data.user!.role,
              token: data.token,
              userid: data.user!.id);
        }else if(state is LoginUserFail){
          setState(() {
            isloading=false;
          });
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.question_mark_rounded))
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    "Enter Your Phone",
                    style: boldText(22),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 48.0, right: 38, top: 15),
                    child: Text(
                      "Your number and address book are used to connect you with your friend",
                      style: regularText(15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 48.0, right: 38, top: 15),
                    child: Text(
                      "By tapping verify you are aggreing to imo's Terms of services and Privacy policy",
                      style: regularText(14,color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            isloading!?Center(child: CircularProgressIndicator(),): Expanded(
                flex: 0,
                child: Form(
                  key: _globalkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text("Bangladesh"),
                          value: countryValue,
                          items: countryList.map((e) {
                            return DropdownMenuItem(value: e, child: Text("$e"));
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              countryValue = val;
                            });
                          },
                        ),
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 20,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(hintText: "+880"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child:BackgroundTextfield(bgColor: Color(0XFFE7EBF6),borderColor: Color(0xFFE7EBF6),controller: phoneTextController,hintText: "Phone Number", readOnly: false, isNumber: false,),
                          ),
                          InkWell(
                            onTap: () {
                              if (_globalkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text("Is this number correct?"),
                                        content: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(phoneTextController.text),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Edit")),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isloading=true;
                                                        });
                                                        BlocProvider.of<LoginCubit>(context).logIn(phoneTextController.text);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("Ok")),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });

                              }

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 18.0, right: 13, left: 10),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                        color: Colors.transparent, width: 1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
