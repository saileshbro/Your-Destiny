import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'story_page.dart';
import 'stories.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Choose Your Story',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: StoryList(),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: OptionsButton(),
              ))
        ],
      ),
    ));
  }
}

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: stories.length,
        separatorBuilder: (context, index) => StoryTileSeparator(),
        itemBuilder: (context, index) => StoryTile(index: index));
  }
}

class StoryTileSeparator extends StatelessWidget {
  const StoryTileSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Divider(
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}

class OptionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO Make the options work
      onTap: () {},
      child: Icon(
        Icons.settings,
        color: Theme.of(context).secondaryHeaderColor,
        size: 50,
      ),
    );
  }
}

class StoryTile extends StatelessWidget {
  final int index;
  final String title; // <<< We may not even need this variable.
  // ^^^ All of the stories are indexed

  StoryTile({@required this.index}) : this.title = stories[index].title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          // All tiles push to the default story as of now
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StoryPage(index)));
        },
      ),
    );
  }
}
