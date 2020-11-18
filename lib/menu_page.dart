import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_buddies_destini/credits.dart';
import 'package:flutter_buddies_destini/settings_page.dart';
import 'package:flutter_buddies_destini/stories.dart';
import 'package:flutter_buddies_destini/story_page.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CreditsButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OptionsButton(),
              )
            ],
          ),
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
      items: context.supportedLocales
          .map((locale) => DropdownMenuItem(
              value: locale, child: Text(locale.languageCode.toUpperCase())))
          .toList(),
    );
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsPage()));
      },
      child: Icon(
        Icons.settings,
        color: Theme.of(context).secondaryHeaderColor,
        size: 50,
      ),
    );
  }
}

class CreditsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreditsPage()));
      },
      child: Icon(
        Icons.info,
        color: Theme.of(context).secondaryHeaderColor,
        size: 50,
      ),
    );
  }
}

class StoryTile extends StatelessWidget {
  final int index; // Index of the story from stories.dart => stories[]
  // Possible options are currently:
  //   - 0: The Stranger
  //   - 1: The Red Letter

  final String title; // This is the story title to be translated.

  StoryTile({@required this.index}) : this.title = stories[index].title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: ListTile(
          title: Text(
            title.tr(),
            // tr() is used to grab the translated text via the easy_localization package
            textAlign: TextAlign.center,
          ),
          onTap: () {
            // When a story button is tapped, the app routes to the corresponding story pageIndex 0.
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StoryPage(index)));
          }),
    );
  }
}
