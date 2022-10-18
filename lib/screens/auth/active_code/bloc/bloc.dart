import 'package:fastkart_app/gen_model/user_model.dart';
import 'package:fastkart_app/helper/server_gate.dart';
import 'package:fastkart_app/main.dart';
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
      UserModel model = UserModel.fromJson(response.response!.data);

      if (event.type == TYPE.register) {
        Prefs.setInt('id', model.data.id);
        Prefs.setString('firstName', model.data.firstName);
        Prefs.setString('lastName', model.data.lastName);
        Prefs.setString('phone', model.data.phone);
        Prefs.setInt('cityId', model.data.cityId);
        Prefs.setString('image', model.data.image);
        Prefs.setString('fcmToken', model.data.fcmToken);
        Prefs.setString('status', model.data.status);
        Prefs.setString('isVerified', model.data.isVerified);
        Prefs.setString('token', model.data.token);
      }

      emit(DoneActiveCodeState(model: model));
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
