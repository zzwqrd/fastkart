import 'package:fastkart_app/helper/server_gate.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/events.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEventStart>(_sendData);
  }
  ServerGate serverGate = ServerGate();

  void _sendData(
    RegisterEventStart event,
    Emitter<RegisterStates> emit,
  ) async {
    emit(RegisterStatesStart());
    CustomResponse response = await serverGate.sendToServer(
      url: 'user/register',
      body: {
        "phone": event.phone.text,
        "city": event.city,
        "first_name": event.firstName.text,
        "last_name": event.lastName.text,
        "password": event.password.text,
        "password_confirmation": event.confirmPassword.text,
      },
    );
    if (response.success) {
      emit(RegisterStateSuccess());
    } else {
      emit(
        RegisterStateFailed(
          errType: response.errType!,
          msg: response.msg,
        ),
      );
    }
  }
}
