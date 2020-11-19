import 'package:flutter_buddies_destini/stories.dart';
import 'package:flutter_buddies_destini/story.dart';

// global StoryBrain variable that holds all of the story logic
StoryBrain storyBrain = StoryBrain();

class StoryBrain {
  // holds the currently selected Story object that is retrieved from the stories array in stories.dart
  Story _storyData;
  // the current page of the story
  int _pageNumber = 0;

  StoryBrain() {
    // init the StoryBrain with the first Story.
    // this doesn't do anything because after a story is selected from menu_page the StoryBrain is reset with the selected Story
    _storyData = getStory(0);
  }

  // reset the StoryBrain with the new Story
  void setStoryBrain(int storyIndex) {
    _storyData = getStory(storyIndex);
    _pageNumber = 0;
  }

  // returns the title of the current Story
  String getTitle() {
    return _storyData.title;
  }

  // returns the credits for the current Story
  String getCredits() {
    return _storyData.title + " " + _storyData.credits;
  }

  // reutrns the current Page of the current Story
  SPage getPage() {
    return _storyData.pages[_pageNumber];
  }

  // returns the choice from the current Page given by the choiceIndex
  Choice getChoice(int choiceIndex) {
    return _storyData.pages[_pageNumber].choices[choiceIndex];
  }

  // sets the _pageNumber variable based on the users choice
  void nextPage(int choiceIndex) {
    Choice c = getChoice(choiceIndex);
    // if the choice pagePointer variable is null, then the story returns to the first page. --> story restarts
    _pageNumber = c.pagePointer ?? 0;
  }
}
