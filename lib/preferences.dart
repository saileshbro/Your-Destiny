/* The purpose of this class is to access shared preferences and enable the user
* to preserve their chosen settings long-term. Currently it only serves as a way
* to store information about fonts, but more features could easily be added.
*                                                           - by Tragikomedes */

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Future<Map<String, dynamic>> loadFont() async {
    var prefs = await SharedPreferences.getInstance();
    int fontSize = prefs.getInt('fontSize') ?? 18;
    String font = prefs.getString('font') ?? 'Roboto';
    return {'fontSize': fontSize, 'font': font};
  }

  static void saveFont(int fontSize, String font) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('font', font);
    prefs.setInt('fontSize', fontSize);
  }

}