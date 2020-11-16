import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_buddies_destini/settings_page.dart';
import 'package:flutter_buddies_destini/stories.dart';
import 'package:easy_localization/easy_localization.dart';
import 'story_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: LanguageChangeButton(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'menu_text'.tr(),
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

// Added a button to change languages - Tragikomedes
class LanguageChangeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: context.locale,
        onChanged: (newLocale) {
        context.locale = newLocale;
        },
    items: context.supportedLocales.map((locale) => DropdownMenuItem(value: locale, child: Text(locale.languageCode.toUpperCase()))).toList(),);
  }
}



class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.vertical,
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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
      },
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
            title.tr(),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            // All tiles push to the default story as of now
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StoryPage(index)));
          }),
    );
  }
}
