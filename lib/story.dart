class Story {
  String text;
  Choices choices;

  Story({this.text, this.choices});
}

class Choices {
  String first;
  String second;
  String third;

  Choices({this.first, this.second = '', this.third = ''});
}
