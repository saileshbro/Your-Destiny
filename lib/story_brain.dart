import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        text:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choices: Choices(
            first: '"I\'ll hop in. Thanks for the help!"',
            second: 'Better ask him if he\'s a murderer first...'
          )
      ),
    Story(
        text: 'He nods slowly, unphased by the question.',
        choices: Choices(
            first: 'At least he\'s honest. I\'ll climb in.',
            second: '"Wait, I know how to change a tire!"'
          )
      ),
    Story(
        text:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choices: Choices(
            first: '"I love Elton John!" \n*Hand him the cassette tape.*',
            second: 'It\'s him or me! \n*You take the knife and stab him.*'
          )
      ),
    Story(
        text:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choices: Choices(
          first: 'Restart',
        )
    ),
    Story(
        text:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choices: Choices(
          first: 'Restart',
    )
    ),
    Story(
        text:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choices: Choices(
          first: 'Restart',
    ))
  ];

  String getStory() {
    return _storyData[_storyNumber].text;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choices.first;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choices.second;
  }

  int _storyNumber = 0;

  void nextStory(int choiceNumber) {
    //When user is on story0 and they chose choice1, the story should progress to story2.
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
