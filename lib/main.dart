import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buddies_destini/font_manager.dart';
import 'package:flutter_buddies_destini/menu_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('pl'), Locale('es')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: Destini()));

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: Colors.black,
        seconds: 5,
        navigateAfterSeconds: MenuPage(),
        title: Text(
          "welcome".tr(),
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.white,
      );
  }
}

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    // Inherited widgets must be on top of the MaterialApp to be conveyed by
    // MaterialPageRoute later on.
    return FontManager(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: LoadingPage(),
      ),
    );
  }
}
