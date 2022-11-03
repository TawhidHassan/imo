

import 'package:logger/logger.dart';

import '../../Data/Login/Login.dart';
import '../../Network/LoginNetworkService/login_network.dart';

class LoginRepository{
  var logger = Logger();
  LoginNetwork loginNetwork=LoginNetwork();


  Future<Login> logIn(String phone) async {
    Map<String, String> data = {
      "phoneNumber": phone,
    };
    final userRaw=await loginNetwork.logIn(data);
    // logger.d(Login.fromJson(userRaw));

    return Login.fromJson(userRaw);
  }


}