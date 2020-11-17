/* This is a mock app whose purpose is to enable font manager's inherited
* widget testing. I couldn't find a way to test TextStyle changes per se, so
* it focuses on testing stringified TextStyle properties.
*                                                           - by Tragikomedes */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_buddies_destini/font_manager.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(
    FontManager(
      child: MaterialApp(
        home: MockWidget(),
      ),
    )
  );
}

class MockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(InheritedFont.of(context).style.fontFamily, key: ValueKey('font family'),),
      Text(InheritedFont.of(context).style.fontSize.toInt().toString(), key: ValueKey('font size')),
      FlatButton(onPressed: () {
        InheritedFont.of(context).changeStyle(12, 'Pacifico');
      }, child: Text('This changes text style'), key: ValueKey('change style button'),)]);
  }
}