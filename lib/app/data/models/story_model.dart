import 'package:flutter/foundation.dart';

import 'story_page_model.dart';

// Story object that holds all relevant information about a single Story
//  - title
//  - credits
//  - pages
class Story {
  String title;
  String credits;
  List<SPage> pages;

  Story({
    @required this.title,
    @required this.credits,
    @required this.pages,
  });
}