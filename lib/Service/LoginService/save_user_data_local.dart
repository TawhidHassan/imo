import 'package:hive/hive.dart';

class LoginDataSave{

  Future storeTokenUserdata(Box? users,String? token,String? id,String? name,String? email,String? role,String? employeId,bool? isAssigned,String? image) async{
    print(id);
    users?.put("token", token);
    users?.put("userId", id);
    users?.put("email", email);
    users?.put("name", name);
    users?.put("role", role);
    users?.put("employeeId", employeId);
    users?.put("isAssigned", isAssigned);

  }
//login

}

