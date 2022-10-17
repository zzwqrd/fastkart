import 'package:fastkart_app/gen_bloc/cities/events.dart';
import 'package:fastkart_app/gen_bloc/cities/model.dart';
import 'package:fastkart_app/gen_bloc/cities/states.dart';
import 'package:fastkart_app/helper/server_gate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityBloc extends Bloc<CityEvents, CityStates> {
  CityBloc() : super(CityStates()) {
    on<CityEventStart>(_getCityData);
  }
  ServerGate serverGate = ServerGate();

  void _getCityData(
    CityEventStart event,
    Emitter<CityStates> emit,
  ) async {
    emit(CityStatesStart());
    CustomResponse response = await serverGate.getFromServer(
      url: 'cities/states_cities',
      // headers: {
      //   "Accept": "application/json",
      //   "content-type": "application/json",
      // },
    );
    if (response.success) {
      CityModel model = CityModel.fromJson(response.response!.data);
      emit(CityStateSuccess(model: model));
    } else {
      emit(
        CityStateFailed(
          errType: response.errType!,
          msg: response.msg,
        ),
      );
    }
  }
}
