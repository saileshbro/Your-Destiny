import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../data/models/models.dart';
import '../../logic/story_brain.dart';

import '../themes/font_manager.dart';

class StoryPage extends StatefulWidget {
  final int index;
  StoryPage(this.index) {
    storyBrain.setStoryBrain(index);
  }

  @override
  _StoryPageState createState() => _StoryPageState(index);
}

class _StoryPageState extends State<StoryPage> {
  final int index;
  TextStyle _style = const TextStyle();

  _StoryPageState(this.index);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _style = InheritedFont.of(context).style;
      });
    });
  }

  void refreshStoryPage(int newPageIndex) {
    setState(() {
      // print(newPageIndex);
      storyBrain.nextPage(newPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        storyBrain.getTitle().tr(),
        style: _style,
      )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // TODO change background image.
            image: AssetImage('images/creepy.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(storyBrain.getPage().text.tr(), style: _style),
                ),
              ),
              ...choiceButtonList(
                  storyBrain.getPage(), refreshStoryPage, _style),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> choiceButtonList(
    SPage storyPage, Function refreshStoryPage, TextStyle style) {
  final int numButtons = storyPage.choices.length;
  final List<Widget> toReturn = <Widget>[];
  for (int i = 0; i < numButtons; i++) {
    toReturn.add(
      choiceButton(
        text: storyPage.choices[i].text.tr(),
        style: style,
        index: i,
        refreshStoryPage: refreshStoryPage,
      ),
    );
  }
  return toReturn;
}

Widget choiceButton(
    {String text, TextStyle style, int index, Function refreshStoryPage}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: FlatButton(
      onPressed: () {
        // print(index);
        refreshStoryPage(index);
      },
      color: Colors.red,
      child: Text(text, style: style),
    ),
  );
}
