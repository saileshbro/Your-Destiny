/* This is a helper function that provides individual widgets or chains of widgets
* with an access to localization files. It's suitable for widget testing, but not
* integration testing. It defaults to English version, but you can change the
* language by passing locale as the second argument.
*  E.g. createLocalizedWidget(SomeWidget(), Locale('pl'))
*                                                            - by Tragikomedes*/

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget createLocalizedWidget(Widget child, [Locale locale]) => EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('pl'), Locale('es')],
      saveLocale: false,
      startLocale: locale ?? const Locale('en'),
      fallbackLocale: const Locale('en'),
      child: MaterialApp(
        home: child,
      ),
    );
