import 'package:fastkart_app/gen_bloc/cities/bloc.dart';
import 'package:fastkart_app/gen_bloc/cities/events.dart';
import 'package:fastkart_app/helper/text_form.dart';
import 'package:fastkart_app/screens/auth/sign_up_screen/bloc/events.dart';
import 'package:fastkart_app/screens/navigation_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

import '../../../helper/btns.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegisterEventStart _event = RegisterEventStart();

  final bloc = KiwiContainer().resolve<CityBloc>()..add(CityEventStart());

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
          SingleChildScrollView(
            child: Container(
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
                        obscureText: true,
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
                        obscureText: true,
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
                        obscureText: true,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TxtField(
                        controller: _event.city,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return '';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (o) {},
                        hintText: 'city',
                        prefix: const Icon(Icons.perm_identity_rounded),
                        enabled: true,
                        obscureText: true,
                        textInputType: TextInputType.text,
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
                      Btn(
                        txt: 'Sign Up',
                        onTap: () {
                          bloc.add(CityEventStart());
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const NavigationBarView(),
                          //   ),
                          //   (Route<dynamic> route) => false,
                          // );
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
