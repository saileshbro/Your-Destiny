import 'stories.dart';
import 'story.dart';

StoryBrain storyBrain = StoryBrain();

class StoryBrain {
  Story _storyData;
  int _pageNumber = 0;

  StoryBrain() {
    _storyData = getStory(0);
  }

  void setStoryBrain(int storyIndex) {
    _storyData = getStory(storyIndex);
    _pageNumber = 0;
  }

  String getTitle() {
    return _storyData.title;
  }

  SPage getPage() {
    return _storyData.pages[_pageNumber];
  }

  Choice getChoice(int choiceIndex) {
    return _storyData.pages[_pageNumber].choices[choiceIndex];
  }

  void nextPage(int choiceIndex) {
    Choice c = getChoice(choiceIndex);
    _pageNumber = c.pagePointer ?? 0;
  }
}
