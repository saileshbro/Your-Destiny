import 'package:flutter/foundation.dart';

// Choice object that holds all relevant information about a single choice on a Page
//  - text holds the choice description
//  - pagePointer points to the next page based on the choice

class Choice {
  String text;
  int pagePointer;

  Choice({
    @required this.text,
    @required this.pagePointer,
  });
}
