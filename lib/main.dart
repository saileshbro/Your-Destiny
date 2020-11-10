import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buddies_destini/menu_page.dart';

void main() => runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('pl'), Locale('es')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    child: Destini()));

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MenuPage(),
    );
  }
}
