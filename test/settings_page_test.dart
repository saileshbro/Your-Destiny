/* These tests focus on checking whether Settings screen loads properly in each
* language version. The functionality of changing settings is not tested here.
*                                                           - by Tragikomedes*/

import 'package:flutter/material.dart';
import 'package:flutter_buddies_destini/app/presentation/pages/settings_page.dart';
import 'package:flutter_buddies_destini/app/presentation/themes/font_manager.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_assets/create_localized_widget.dart';

void main() {
  group('Settings page', () {
    testWidgets('Check English version of the Settings page',
        (WidgetTester tester) async {
      await tester.pumpWidget(createLocalizedWidget(InheritedFont(
          fontSize: 18,
          font: 'Roboto',
          changeStyle: () {},
          child: SettingsPage())));
      await tester.pumpAndSettle();

      final title = find.text("Settings");
      final fontSize = find.text("Story font size");
      final fontFamily = find.text("Story font");
      final button = find.text("Apply Changes");

      expect(title, findsOneWidget);
      expect(fontSize, findsOneWidget);
      expect(fontFamily, findsOneWidget);
      expect(button, findsOneWidget);
    });
    testWidgets('Check Polish version of the Settings page',
        (WidgetTester tester) async {
      await tester.pumpWidget(createLocalizedWidget(
          InheritedFont(
              fontSize: 18,
              font: 'Roboto',
              changeStyle: () {},
              child: SettingsPage()),
          const Locale('pl')));
      await tester.pumpAndSettle();

      final title = find.text("Ustawienia");
      final fontSize = find.text("Wielkość czcionki opowieści");
      final fontFamily = find.text("Czcionka opowieści");
      final button = find.text("Zastosuj");

      expect(title, findsOneWidget);
      expect(fontSize, findsOneWidget);
      expect(fontFamily, findsOneWidget);
      expect(button, findsOneWidget);
    });
// TODO Spanish translation and appropriate test
  });
}
