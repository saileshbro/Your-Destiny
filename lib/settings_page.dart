/* This is a settings page that currently focuses on changing font properties.
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
  final List<int> _fontSizes = [8, 10, 12, 14, 16, 18, 20, 22];
  final List<String> _fonts = ['Roboto', 'Lato', 'Montserrat', 'Pacifico'];

  int _selectedFontSize;
  String _selectedFont;

  @override
  void initState() {
    _selectedFontSize = 14;
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
      appBar: AppBar(title: Text('Settings',),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Story font size'),
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
            Row(
              children: [
                Text('Story font'),
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
            RaisedButton(onPressed: () {
              // Changing current font settings and saving them for future use
              InheritedFont.of(context).changeStyle(_selectedFontSize, _selectedFont);
              Preferences.saveFont(_selectedFontSize, _selectedFont);
            }, child: Text('Apply Changes'),),
          ],
        ),
      ),
    );
  }
}
