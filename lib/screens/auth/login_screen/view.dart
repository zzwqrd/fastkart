import 'package:fastkart_app/helper/btns.dart';
import 'package:fastkart_app/helper/flash_helper.dart';
import 'package:fastkart_app/helper/rout.dart';
import 'package:fastkart_app/helper/text_form.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/bloc.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/events.dart';
import 'package:fastkart_app/screens/auth/login_screen/bloc/states.dart';
import 'package:fastkart_app/screens/navigation_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

import '../sign_up_screen/view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginEventStart _event = LoginEventStart();
  final LoginBloc _bloc = KiwiContainer().resolve();
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
                              "Login Account",
                              style: TextStyle(color: Color(0xFF222222), fontSize: 14, fontWeight: FontWeight.w800, height: 1.5),
                            ),
                          ],
                        ),
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
                      SizedBox(
                        height: 18.h,
                      ),
                      BlocConsumer(
                        bloc: _bloc,
                        listener: (context, state) {
                          if (state is LoginStateSuccess) {
                            // ActiveCodeView
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationBarView(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                            print("🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶🐶 ${_event.phone.toString()}");

                            FlashHelper.errorBar(message: state.model.message);
                          } else if (state is LoginStateFailed) {
                            FlashHelper.errorBar(message: state.msg);
                            print("🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑");
                          }
                        },
                        builder: (context, state) {
                          return Btn(
                            txt: 'Sign In',
                            onTap: () {
                              if (_event.formKey.currentState!.validate()) {
                                _bloc.add(_event);
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
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xFF0baf9a),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
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
                                color: const Color(0xFFe8e8e8),
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
                                color: const Color(0xFFe8e8e8),
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
