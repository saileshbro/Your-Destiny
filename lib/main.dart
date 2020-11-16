import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buddies_destini/font_manager.dart';
import 'package:flutter_buddies_destini/menu_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('pl'), Locale('es')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: loadingPage()));

class loadingPage extends StatefulWidget {
  @override
  _loadingPageState createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        backgroundColor: Colors.black,
        seconds: 5,
        navigateAfterSeconds: Destini(),
        title: Text(
          "Welcome to Your Destiny",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        routeName: "/",
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.white,
      ),
    );
  }
}

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return FontManager(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MenuPage(),
      ),
    );
  }
}