import 'package:fastkart_app/gen_model/user_model.dart';

class LoginStates {}

class LoginStatesStart extends LoginStates {}

class LoginStateSuccess extends LoginStates {
  final UserModel model;
  LoginStateSuccess({
    required this.model,
  });
}

class LoginStateFailed extends LoginStates {
  String msg;
  int errType;
  LoginStateFailed({
    required this.msg,
    required this.errType,
  });
}
