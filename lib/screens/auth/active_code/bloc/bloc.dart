import 'package:fastkart_app/helper/server_gate.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/events.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveCodeBloc extends Bloc<ActiveCodeEvent, ActiveCodeState> {
  ActiveCodeBloc() : super(ActiveCodeState()) {
    on<StartActiveCodeEvent>(_sendCode);
  }
  ServerGate serverGate = ServerGate();

  void _sendCode(
    StartActiveCodeEvent event,
    Emitter<ActiveCodeState> emit,
  ) async {
    emit(LoadingActiveCodeState());
    CustomResponse response = await serverGate.sendToServer(
      url: 'user/verify',
      body: {
        "code": event.activeCode.text,
        "phone": event.mobile.text,
      },
    );
    if (response.success) {
      if (event.type == TYPE.register) {
        // UserHelper.setUserData(
        //     UserModel.fromJson(response.response?.data["data"]));
      }
      emit(DoneActiveCodeState(msg: response.msg));
    } else {
      emit(
        FaildActiveCodeState(
          errType: response.errType!,
          msg: response.msg,
        ),
      );
    }
  }
}
