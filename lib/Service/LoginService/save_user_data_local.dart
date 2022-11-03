import 'package:hive/hive.dart';

class LoginDataSave{

  Future storeTokenUserdata(
      {Box? users,
      String? token,
      String? id,
      String? name,
      String? phone,
      String? role,
      String? image}) async{
    print(id);
    users?.put("token", token);
    users?.put("userId", id);
    users?.put("phone", phone);
    users?.put("name", name);
    users?.put("role", role);

  }
//login

}

