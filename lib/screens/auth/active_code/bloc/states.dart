class ActiveCodeState {}

class LoadingActiveCodeState extends ActiveCodeState {}

class FaildActiveCodeState extends ActiveCodeState {
  String msg;
  int errType;
  FaildActiveCodeState({required this.errType, required this.msg});
}

class DoneActiveCodeState extends ActiveCodeState {
  String msg;
  DoneActiveCodeState({required this.msg});
}
