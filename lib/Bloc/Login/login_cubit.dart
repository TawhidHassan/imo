import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Login/Login.dart';
import '../../Repository/LoginRepository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository=LoginRepository();
  LoginCubit() : super(LoginInitial());

  void logIn(String text) {
    loginRepository.logIn(text).then((result) => {
      // logger.d(result.status.toString()),
      if(result!=null){
        if(result.status=="fail"){
          emit(LoginUserFail(login: result))
        }else{
          emit(LoginUser(login: result))
        }

      }
    });
  }
}
