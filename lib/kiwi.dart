import 'package:fastkart_app/gen_bloc/cities/bloc.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/bloc.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/home_screen/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => CityBloc());
  container.registerFactory((c) => RegisterBloc());
  container.registerFactory((c) => ActiveCodeBloc());
  container.registerFactory((c) => LoginBloc());
  // home bloc
  container.registerFactory((c) => HomeBloc());
}
