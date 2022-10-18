import 'package:fastkart_app/gen_model/home_model.dart';

class HomeStates {}

class HomeStateStart extends HomeStates {}

class HomeStateSuccesses extends HomeStates {
  HomeModel model;
  HomeStateSuccesses({
    required this.model,
  });
}

class HomeStateFailed extends HomeStates {
  String msg;
  int errType;
  HomeStateFailed({
    required this.errType,
    required this.msg,
  });
}
