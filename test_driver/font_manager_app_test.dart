/* This is an integration test that focuses on the inherited widget that
* handles text style changes. To run, open the terminal and enter:
* flutter drive --target=test_driver/font_manager_app.dart
*                                                           - by Tragikomedes */

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Font manager', () {
    final fontSizeText = find.byValueKey('font size');
    final fontFamilyText = find.byValueKey('font family');
    final changeStyleButton = find.byValueKey('change style button');

    FlutterDriver driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Given access to inherited widget When no changes happen Then descendant shows default value', () async {
      expect(await driver.getText(fontSizeText), 18.toString());
      expect(await driver.getText(fontFamilyText), 'Roboto');
    });

    test('Given access to inherited widget When the value of parent stateful widget changes Then inherited widget conveys changes to descendant', () async {
      expect(await driver.getText(fontSizeText), 18.toString());
      expect(await driver.getText(fontFamilyText), 'Roboto');

      await driver.tap(changeStyleButton);

      expect(await driver.getText(fontSizeText), 12.toString());
      expect(await driver.getText(fontFamilyText), 'Pacifico');
    });
  });

}


