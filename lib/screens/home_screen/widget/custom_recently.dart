import 'package:fastkart_app/screens/home_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/home_screen/bloc/events.dart';
import 'package:fastkart_app/screens/home_screen/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

final HomeBloc _bloc = KiwiContainer().resolve()..add(HomeEventStart());
Widget customRecently() {
  return BlocBuilder(
    bloc: _bloc,
    builder: (context, state) {
      if (state is HomeStateStart) {
        return Center(child: Container(width: 30, height: 30, child: const CircularProgressIndicator()));
      } else if (state is HomeStateSuccesses) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFedf8f8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Buy from Recently Bought",
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.model.data.categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    print('🐹🐹🐹🐹🐹🐹🐹🐹 ....... $index');
                                  },
                                  child: Image.network(
                                    state.model.data.categories[index].image,
                                    // "https://themes.pixelstrap.com/fastkart-app/assets/images/product/7.png",
                                    width: 60,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/icons/corner.png',
                    width: 30.w,
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (state is HomeStateFailed) {
        return Center(
          child: Text(state.msg),
        );
      } else {
        return Center(
          child: Container(
            width: 30,
            height: 30,
            child: const CircularProgressIndicator(),
          ),
        );
      }
    },
  );
}
