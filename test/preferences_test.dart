import 'package:test/test.dart';
import 'package:flutter_buddies_destini/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Preferences', () {
    test('Given an instance of shared preferences When font size and family are saved and retrieved Then return map with data', () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String font = 'Lato';
      int fontSize = 22;

      prefs.setString('font', font);
      prefs.setInt('fontSize', fontSize);

      expect(prefs.getString('font'), 'Lato');
      expect(prefs.getInt('fontSize'), 22);
    });

    test('Given the access to Preferences class When font info is saved Then the info should be succesfully retrieved', () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Preferences.saveFont(12, 'Pacifico', prefs);

      Map<String, dynamic> result = await Preferences.loadFont(prefs);
      expect(result['font'], 'Pacifico');
      expect(result['fontSize'], 12);
    });

    test('Given the access to Preferences class When no saved font info is found Then the default info should be returned', () async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> result = await Preferences.loadFont(prefs);

      expect(result['font'], 'Roboto');
      expect(result['fontSize'], 18);
    });
  });
}