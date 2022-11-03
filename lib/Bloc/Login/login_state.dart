part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginUser extends LoginState{
  late final Login? login;

  LoginUser({this.login});
}

class LoginUserFail extends LoginState{
  late final Login? login;

  LoginUserFail({this.login});
}