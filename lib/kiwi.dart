import 'package:fastkart_app/gen_bloc/cities/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => CityBloc());
}
