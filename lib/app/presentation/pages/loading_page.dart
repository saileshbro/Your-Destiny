import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../main.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        backgroundColor: Colors.black,
        seconds: 5,
        navigateAfterSeconds: Destini(),
        title: Text(
          "welcome".tr(),
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        routeName: "/",
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.white,
      ),
    );
  }
}
