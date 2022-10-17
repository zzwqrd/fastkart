import 'package:fastkart_app/gen_bloc/cities/model.dart';

class CityStates {}

class CityStatesStart extends CityStates {}

class CityStateSuccess extends CityStates {
  CityModel model;
  CityStateSuccess({
    required this.model,
  });
}

class CityStateFailed extends CityStates {
  String msg;
  int errType;
  CityStateFailed({
    required this.msg,
    required this.errType,
  });
}
