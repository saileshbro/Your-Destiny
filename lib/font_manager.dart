/* This is a helper class that enables dynamic font changes throughout the
* entire app. Stateful widget enables us to do the actual changes which are
* then transferred to all the widgets that can access the inherited widget
* (which is immutable by default).
*                                                           - by Tragikomedes*/

import 'package:flutter/cupertino.dart';
import 'package:flutter_buddies_destini/preferences.dart';


class FontManager extends StatefulWidget {
  FontManager({@required this.child});
  final Widget child;

  @override
  _FontManagerState createState() => _FontManagerState();
}

class _FontManagerState extends State<FontManager> {
  int fontSize = 18;
  String font = "Roboto";

  @override
  void initState() {
    // Info retrieved from shared preferences
    Preferences.loadFont().then((fontInfo) => setState(() {
      fontSize = fontInfo['fontSize'];
      font = fontInfo['font'];
    }));
    super.initState();
  }

  void changeStyle(int size, String fontFamily) {
    setState(() {
      fontSize = size;
      font = fontFamily;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedFont(font: font, fontSize: fontSize, changeStyle: changeStyle,child: widget.child);
  }
}


class InheritedFont extends InheritedWidget {
  InheritedFont({@required this.font, @required this.fontSize, @required this.changeStyle, @required this.child}):
  style = TextStyle(
    fontSize: fontSize.toDouble(),
    fontFamily: font,
  ),
  super(child: child);

  final Widget child;
  final String font;
  final int fontSize;
  final Function changeStyle;
  final TextStyle style;

  static InheritedFont of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedFont>();

  @override
  bool updateShouldNotify(covariant InheritedFont old)  => style != old.style;
}