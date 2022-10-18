import 'package:fastkart_app/gen_model/user_model.dart';

class ActiveCodeState {}

class LoadingActiveCodeState extends ActiveCodeState {}

class FaildActiveCodeState extends ActiveCodeState {
  String msg;
  int errType;
  FaildActiveCodeState({required this.errType, required this.msg});
}

class DoneActiveCodeState extends ActiveCodeState {
  UserModel model;
  DoneActiveCodeState({required this.model});
}
