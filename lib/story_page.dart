import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'story.dart';

class StoryPage extends StatefulWidget {
  final int index;
  StoryPage(this.index) {
    storyBrain.setStoryBrain(index);
  }

  _StoryPageState createState() => _StoryPageState(index);
}

class _StoryPageState extends State<StoryPage> {
  final int index;
  _StoryPageState(this.index);

  void refreshStoryPage(int newPageIndex) {
    setState(() {
      print(newPageIndex);
      storyBrain.nextPage(newPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(storyBrain.getTitle())),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // TODO change background image.
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getPage().text,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              ...choiceButtonList(storyBrain.getPage(), refreshStoryPage),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> choiceButtonList(SPage storyPage, Function refreshStoryPage) {
  int numButtons = storyPage.choices.length;
  List<Widget> toReturn = List<Widget>();
  for (int i = 0; i < numButtons; i++) {
    toReturn.add(
      choiceButton(
        text: storyPage.choices[i].text,
        index: i,
        refreshStoryPage: refreshStoryPage,
      ),
    );
  }
  return toReturn;
}

Widget choiceButton({String text, int index, Function refreshStoryPage}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: FlatButton(
      onPressed: () {
        print(index);
        refreshStoryPage(index);
      },
      color: Colors.red,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    ),
  );
}
