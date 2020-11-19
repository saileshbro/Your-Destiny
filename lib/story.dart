import 'package:flutter/material.dart';

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

// SPage object that holds all relevant information about a single page of a Story
//  - text holds the main text of the page
//  - pageIndex is used for page reference between each page
//  - choices list of the available choices
//  - background? I don't know what this is for... I don't think its being used right now.
class SPage {
  // I had to change the class name from Page to SPage because my IDE was getting confused with the Flutter Page class
  String text;
  int pageIndex;
  List<Choice> choices;
  String background;

  SPage({
    @required this.text,
    @required this.pageIndex,
    @required this.choices,
    this.background,
  });
}

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
