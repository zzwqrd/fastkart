class RegisterStates {}

class RegisterStatesStart extends RegisterStates {}

class RegisterStateSuccess extends RegisterStates {}

class RegisterStateFailed extends RegisterStates {
  String msg;
  int errType;
  RegisterStateFailed({
    required this.msg,
    required this.errType,
  });
}
