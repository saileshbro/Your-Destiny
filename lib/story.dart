class Stories {
  List<Story> stories;
  
  Stories({this.stories});
}

class Story {
  String title;
  Pages story;

  Story({this.title, this.story});
}

class Pages {
  List<Page> pages;

  Pages({this.pages});
}

class Page {
  String text;
  int page;
  Choices choices;

  Page({this.text, this.page, this.choices});
}

class Choices {
  String first;
  String second;
  String third;

  Choices({this.first, this.second = '', this.third = ''});
}
