import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/model.dart';

class RegisterStates {}

class RegisterStatesStart extends RegisterStates {}

class RegisterStateSuccess extends RegisterStates {
  final RegisterModel model;
  RegisterStateSuccess({
    required this.model,
  });
}

class RegisterStateFailed extends RegisterStates {
  String msg;
  int errType;
  RegisterStateFailed({
    required this.msg,
    required this.errType,
  });
}
