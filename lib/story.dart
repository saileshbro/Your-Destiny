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
  String background;

  Page({this.text, this.page, this.choices, this.background});
}

class Choices {
  String first;
  String second;
  String third;

  Choices({this.first, this.second = '', this.third = ''});
}
