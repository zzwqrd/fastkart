import 'package:easy_localization/easy_localization.dart';
import 'package:fastkart_app/helper/un_foucs.dart';
import 'package:fastkart_app/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/splash_screen/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  runApp(
    // دي كدا استدعاء اللغه
    EasyLocalization(
      path: 'assets/lang',
      saveLocale: true,
      startLocale: Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'thimar',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // navigatorKey: navigator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            // primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
            fontFamily: 'TajawalBold',
            appBarTheme:const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 75,
              titleTextStyle: TextStyle(
                // color: AppTheme.mainColor,
                fontFamily: 'TajawalBold',
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: UnFocus(child: widget!),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}


