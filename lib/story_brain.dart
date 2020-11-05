import 'stories.dart';

class StoryBrain {
  final _storyData = getStory("stranger");

  String getPage() {
    return _storyData.story.pages[_pageNumber].text;
  }

  String getChoice1() {
    return _storyData.story.pages[_pageNumber].choices.first;
  }

  String getChoice2() {
    return _storyData.story.pages[_pageNumber].choices.second;
  }

  String getChoice3() {
    return _storyData.story.pages[_pageNumber].choices.third;
  }

  int _pageNumber = 0;

  void nextPage(int choiceNumber) {
    //When user is on story0 and they chose choice1, the story should progress to story2.
    if (choiceNumber == 1 && _pageNumber == 0) {
      _pageNumber = 2;
    } else if (choiceNumber == 2 && _pageNumber == 0) {
      _pageNumber = 1;
    } else if (choiceNumber == 1 && _pageNumber == 1) {
      _pageNumber = 2;
    } else if (choiceNumber == 2 && _pageNumber == 1) {
      _pageNumber = 3;
    } else if (choiceNumber == 1 && _pageNumber == 2) {
      _pageNumber = 5;
    } else if (choiceNumber == 2 && _pageNumber == 2) {
      _pageNumber = 4;
    } else if (_pageNumber == 3 || _pageNumber == 4 || _pageNumber == 5) {
      restart();
    }
  }

  void restart() {
    _pageNumber = 0;
  }

  bool buttonShouldBeVisible() {
    //You could also just check if (_pageNumber < 3)
    if (_pageNumber == 0 || _pageNumber == 1 || _pageNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
