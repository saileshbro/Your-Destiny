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
              ChoiceList(storyBrain.getPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceList extends StatefulWidget {
  final SPage storyPage;
  ChoiceList(this.storyPage);

  @override
  _ChoiceListState createState() => _ChoiceListState(this.storyPage);
}

class _ChoiceListState extends State<ChoiceList> {
  final SPage storyPage;
  _ChoiceListState(this.storyPage);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 2,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20.0,
        );
      },
      itemBuilder: (context, index) {
        return Expanded(
          flex: 2,
          child: FlatButton(
            onPressed: () {
              setState(() {
                storyBrain.nextPage(index);
              });
            },
            color: Colors.red,
            child: Text(
              "This is a choice...",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
