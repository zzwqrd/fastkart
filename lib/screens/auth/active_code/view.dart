import 'package:fastkart_app/helper/btns.dart';
import 'package:fastkart_app/helper/custom_pin_code.dart';
import 'package:fastkart_app/helper/extintions.dart';
import 'package:fastkart_app/helper/flash_helper.dart';
import 'package:fastkart_app/main.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/bloc.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/events.dart';
import 'package:fastkart_app/screens/auth/active_code/bloc/states.dart';
import 'package:fastkart_app/screens/navigation_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

class ActiveCodeView extends StatefulWidget {
  final StartActiveCodeEvent event;
  const ActiveCodeView({Key? key, required this.event}) : super(key: key);

  @override
  State<ActiveCodeView> createState() => _ActiveCodeViewState();
}

class _ActiveCodeViewState extends State<ActiveCodeView> {
  final activeCode = TextEditingController();
  final ActiveCodeBloc _bloc = KiwiContainer().resolve<ActiveCodeBloc>();
  late StartActiveCodeEvent _event;

  @override
  void initState() {
    _event = widget.event;
    print('🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚🐚 ${widget.event.type.toString()}');

    super.initState();
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
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    CustomPinCode(controller: _event.activeCode).paddingSymmetric(horizontal: 20.w),
                    BlocConsumer(
                      bloc: _bloc,
                      listener: (context, state) {
                        if (state is DoneActiveCodeState) {
                          if (_event.type == TYPE.register) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationBarView(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }

                          FlashHelper.successBar(message: state.model.message);
                        } else if (state is FaildActiveCodeState) {
                          FlashHelper.errorBar(message: state.msg);
                          print("🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑🌑");
                        }
                      },
                      builder: (context, state) {
                        return Btn(
                          txt: 'Sign Up',
                          onTap: () {
                            _bloc.add(_event);
                            print('<<<<<<<<<<<<<<<<<<<<<<<___________________________ ${Prefs.getString("data")}');
                          },
                        );
                      },
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
