/* This is a settings page that currently focuses on changing font properties.
   Preserving the settings for later use is handled by Preferences class which
   utilizes Shared Preferences. Accessing the settings by other widgets is
   achieved by using InheritedWidget created by FontManager when settings
   change.
*                                                           - by Tragikomedes*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_buddies_destini/preferences.dart';
import 'font_manager.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<int> _fontSizes = [12, 14, 16, 18, 20, 22, 24];
  final List<String> _fonts = ['Roboto', 'Lato', 'Montserrat', 'Pacifico'];

  int _selectedFontSize;
  String _selectedFont;

  @override
  void initState() {
    _selectedFontSize = 18;
    _selectedFont = 'Roboto';
    super.initState();
    // This is the best way I know to access context in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedFontSize = InheritedFont.of(context).fontSize;
        _selectedFont = InheritedFont.of(context).font;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings_appbar'.tr(),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Spacer(),
            // Font size changing
            Row(
              children: [
                Text('settings_font_size'.tr(), style: TextStyle(fontSize: 20),),
                Spacer(),
                DropdownButton(
                  value: _selectedFontSize,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFontSize = newValue;
                    });
                  },
                  items: _fontSizes.map((size) => DropdownMenuItem(value: size, child: Text(size.toString(), style: TextStyle(fontSize: size.toDouble()),))).toList(),)
              ],
            ),
            // Font family changing
            Row(
              children: [
                Text('settings_font_family'.tr(), style: TextStyle(fontSize: 20),),
                Spacer(),
                DropdownButton(
                  value: _selectedFont,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFont = newValue;
                    });
                  },
                  items: _fonts.map((font) => DropdownMenuItem(value: font, child: Text(font, style: TextStyle(fontFamily: font),))).toList(),)
              ],
            ),
            Spacer(),
            RaisedButton(onPressed: () {
              // Changing current font settings and saving them for future use
              InheritedFont.of(context).changeStyle(_selectedFontSize, _selectedFont);
              Preferences.saveFont(_selectedFontSize, _selectedFont);
              Navigator.pop(context);
            }, child: Text("settings_apply".tr(), style: TextStyle(fontSize: 20),),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
