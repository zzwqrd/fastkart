import 'package:fastkart_app/gen_model/user_model.dart';
import 'package:fastkart_app/helper/server_gate.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/events.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginEventStart>(_sendData);
  }
  ServerGate serverGate = ServerGate();

  void _sendData(
    LoginEventStart event,
    Emitter<LoginStates> emit,
  ) async {
    emit(LoginStatesStart());
    CustomResponse response = await serverGate.sendToServer(
      url: 'user/login',
      body: {
        "phone": event.phone.text,
        "password": event.password.text,
      },
    );
    if (response.success) {
      UserModel model = UserModel.fromJson(response.response!.data);
      Prefs.setInt('id', model.data.id);
      Prefs.setString('firstName', model.data.firstName);
      Prefs.setString('lastName', model.data.lastName);
      Prefs.setString('phone', model.data.phone);
      Prefs.setInt('cityId', model.data.cityId);
      Prefs.setString('image', model.data.image);
      Prefs.setString('fcmToken', model.data.fcmToken);
      Prefs.setString('status', model.data.status);
      Prefs.setInt('isVerified', model.data.isVerified);
      Prefs.setString('token', model.data.token);
      emit(LoginStateSuccess(model: model));
    } else {
      emit(
        LoginStateFailed(
          errType: response.errType!,
          msg: response.msg,
        ),
      );
    }
  }
}
