import 'story.dart';

var stories = [
  Story(
    title: "The Stranger",
    story: Pages(
      pages: [
        Page(
          page: 0,
          text:
              'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
          choices: Choices(
              first: '"I\'ll hop in. Thanks for the help!"',
              second: 'Better ask him if he\'s a murderer first...'),
        ),
        Page(
          page: 1,
          text: 'He nods slowly, unphased by the question.',
          choices: Choices(
              first: 'At least he\'s honest. I\'ll climb in.',
              second: '"Wait, I know how to change a tire!"'),
            ),
        Page(
          page: 2,
          text:
              'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
          choices: Choices(
              first: '"I love Elton John!" \n*Hand him the cassette tape.*',
              second: 'It\'s him or me! \n*You take the knife and stab him.*'),),
        Page(
          page: 3,
          text:
              'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
          choices: Choices(
            first: 'Restart',
          ),),
        Page(
          page: 4,
          text:
              'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
          choices: Choices(
            first: 'Restart',
          ),),
        Page(
          page: 5,
          text:
              'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
          choices: Choices(
            first: 'Restart',
          ),),
      ],
    ),
  ),
];

getStory(title) {
  for (Story story in stories) {
    if (story.title.toLowerCase() == title.toString().toLowerCase()){
      return story;
    }
  }
}