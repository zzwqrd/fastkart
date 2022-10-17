import 'package:easy_localization/easy_localization.dart';
import 'package:fastkart_app/gen_bloc/cities/bloc.dart';
import 'package:fastkart_app/gen_bloc/cities/events.dart';
import 'package:fastkart_app/gen_bloc/cities/states.dart';
import 'package:fastkart_app/helper/app_theme.dart';
import 'package:fastkart_app/helper/text_form.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/events.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

import '../../../helper/btns.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegisterEventStart _event = RegisterEventStart();
  final RegisterBloc _registerBloc = KiwiContainer().resolve();

  final bloc = KiwiContainer().resolve<CityBloc>()..add(CityEventStart());

  String cityName = '';

  bool addCity = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF0baf9a),
            child: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80.h),
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _event.formKey,
              child: Container(
                padding: EdgeInsets.only(top: 20.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/logo.png',
                              width: 100.w,
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            const Text(
                              "Online Supermarket for all your daily needs. you are just One Click away from your all needs at your door step.",
                              style: TextStyle(color: Color(0xFF777777), fontSize: 11, fontWeight: FontWeight.w800, height: 1.5),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Register Account",
                              style: TextStyle(color: Color(0xFF222222), fontSize: 14, fontWeight: FontWeight.w800, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TxtField(
                        controller: _event.firstName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'Full Name',
                        prefix: const Icon(Icons.perm_identity_rounded),
                        enabled: true,
                        obscureText: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TxtField(
                        controller: _event.lastName,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'lastName',
                        prefix: const Icon(Icons.perm_identity_rounded),
                        enabled: true,
                        obscureText: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TxtField(
                        controller: _event.phone,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'phone',
                        prefix: const Icon(Icons.perm_identity_rounded),
                        enabled: true,
                        obscureText: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocBuilder(
                                bloc: bloc,
                                builder: (context, state) {
                                  if (state is CityStatesStart) {
                                    return const CircularProgressIndicator();
                                  } else if (state is CityStateSuccess) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 15,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  print('🦊🦊🦊🦊🦊🦊🦊🦊 ${state.model.data!.cities[index].id}');
                                                  addCity = true;
                                                  if (addCity == true) {
                                                    print(state.model.data!.cities[index].title);
                                                    cityName = state.model.data!.cities[index].title;
                                                    _event.city = state.model.data!.cities[index].id;
                                                    print(state.model.data!.cities[index].id);
                                                  } else {
                                                    addCity = false;
                                                  }
                                                  Navigator.of(context).pop();
                                                  // print(careData.name);
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 15,
                                                  top: 15,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.mainColor,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: Text(
                                                  state.model.data!.cities[index].title,
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) => const SizedBox(
                                          width: 10,
                                        ),
                                        itemCount: state.model.data!.cities.length,
                                      ),
                                    );
                                  } else if (state is CityStateFailed) {
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
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: cityName == ''
                                ? const Text(
                                    "LocaleKeys.Auth_City",
                                    style: TextStyle(
                                      color: Color(0xFFC1C1C1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ).tr()
                                : Text(
                                    "${cityName}",
                                    style: const TextStyle(
                                      color: Color(0xFFC1C1C1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ).tr(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TxtField(
                        controller: _event.password,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'password',
                        prefix: const Icon(Icons.remove_red_eye),
                        enabled: true,
                        obscureText: true,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TxtField(
                        controller: _event.confirmPassword,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'confirmPassword',
                        prefix: const Icon(Icons.remove_red_eye),
                        enabled: true,
                        obscureText: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      BlocConsumer(
                        bloc: _registerBloc,
                        listener: (context, state) {
                          if (state is RegisterStateSuccess) {
                            print("🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶 ${_event.lastName.toString()}");
                            print("🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶 ${_event.city.toString()}");
                          } else if (state is RegisterStateFailed) {
                            print("🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑");
                          }
                        },
                        builder: (context, state) {
                          return Btn(
                            txt: 'Sign Up',
                            onTap: () {
                              if (_event.formKey.currentState!.validate()) {
                                // _registerBloc.add(_event);
                                print("🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓🌓${_event.lastName.toString()}");
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Sign In 3333",
                            style: TextStyle(
                              color: Color(0xFF0baf9a),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "?Already have an Account",
                            style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color(0xFFe8e8e8),
                                height: 60.h,
                              ),
                            ),
                            const Text(
                              " Or login with ",
                              style: TextStyle(
                                color: Color(0xFF0baf9a),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Color(0xFFe8e8e8),
                                height: 60.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
