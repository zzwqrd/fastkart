import 'dart:math';
import 'dart:ui';

import 'package:fastkart_app/helper/app_theme.dart';
import 'package:fastkart_app/screens/home_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/home_screen/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

import '../bloc/events.dart';

final HomeBloc _bloc = KiwiContainer().resolve()..add(HomeEventStart());
Widget customCategory() {
  return BlocBuilder(
    bloc: _bloc,
    builder: (context, state) {
      if (state is HomeStateStart) {
        return Center(child: Container(width: 30, height: 30, child: const CircularProgressIndicator()));
      } else if (state is HomeStateSuccesses) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.all(4.0),
            childAspectRatio: 8.0 / 13.0,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: List.generate(
              state.model.data.categories.length,
              (index) {
                return GridTile(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print(
                              "_____________________________________ ${state.model.data.categories[index].id} + ${state.model.data.categories[index].title}");
                        },
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color((Random().nextDouble() * 0xfff7ce).toInt()).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            state.model.data.categories[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        state.model.data.categories[index].title,
                        style: AppTheme.categoryStayle,
                      )
                    ],
                  ),
                );
              },
            ),
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
