import 'package:fastkart_app/gen_model/home_model.dart';
import 'package:fastkart_app/helper/server_gate.dart';
import 'package:fastkart_app/screens/home_screen/bloc/events.dart';
import 'package:fastkart_app/screens/home_screen/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(HomeStates()) {
    on<HomeEventStart>(_getData);
  }

  ServerGate serverGate = ServerGate();

  void _getData(
    HomeEventStart event,
    Emitter<HomeStates> emir,
  ) async {
    emit(HomeStateStart());
    CustomResponse response = await serverGate.getFromServer(
      url: 'home',
    );
    if (response.success) {
      HomeModel model = HomeModel.fromJson(response.response!.data);
      emit(HomeStateSuccesses(model: model));
    } else {
      emit(HomeStateFailed(errType: response.errType!, msg: response.msg));
    }
  }
}
