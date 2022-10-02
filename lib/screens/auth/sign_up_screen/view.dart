import 'package:fastkart_app/helper/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                  children: [
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
                      prefix: Icon(Icons.verified_user),
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
                      hintText: 'Full Name',
                      prefix: Icon(Icons.verified_user),
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
                      hintText: 'Full Name',
                      prefix: Icon(Icons.verified_user),
                      enabled: true,
                      obscureText: true,
                      textInputType: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
