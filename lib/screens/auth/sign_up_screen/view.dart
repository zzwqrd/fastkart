import 'package:fastkart_app/helper/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

import '../../../helper/btns.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF0baf9a),
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
                          Image.asset('assets/icons/logo.png',width: 100.w,),
                           SizedBox(
                            height: 18.h,
                          ),
                          const Text(
                            "Online Supermarket for all your daily needs. you are just One Click away from your all needs at your door step.",
                            style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              height: 1.5
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Register Account",
                            style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                height: 1.5
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TxtField(
                      controller: fullNameController,
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
                      height: 20,
                    ),
                    TxtField(
                      controller: fullNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (o) {},
                      hintText: 'Email Address',
                      prefix: const Icon(Icons.alternate_email),
                      enabled: true,
                      obscureText: true,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtField(
                      controller: fullNameController,
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
                    Btn(
                      txt: 'Sign Up',
                      onTap: () {},
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
        ],
      ),
    );
  }
}
