import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/presentation/pages/loading_page.dart';
import 'app/presentation/pages/menu_page.dart';
import 'app/presentation/themes/font_manager.dart';

void main() => runApp(
      EasyLocalization(
        supportedLocales:const [Locale('en'), Locale('pl'), Locale('es')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: LoadingPage(),
      ),
    );

class Destini extends StatelessWidget {
  @override
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
