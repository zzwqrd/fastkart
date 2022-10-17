import 'package:fastkart_app/gen_bloc/cities/bloc.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => CityBloc());
  container.registerFactory((c) => RegisterBloc());
}
