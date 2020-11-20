import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/provider/stories.dart';

/*  A simple credits page was created in order to
highlight the creators of the story and the developers that worked on the project
  -Rift3000 */

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double headLine = 35.0;

    final allStoryList = getAllStories();
    final developers = [
      "Tragikomedes",
      "hanskokx",
      "ion05",
      "goober0329",
      "Rift3000",
      "ProtoManGG",
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
              child: Center(
                child: Text(
                  "credits_story".tr(),
                  style: const TextStyle(
                    fontSize: headLine,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allStoryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allStoryList[index].title.tr()),
                    subtitle: Text(allStoryList[index].credits.tr()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60.0,
              child: Center(
                child: Text(
                  "credits_developers".tr(),
                  style: const TextStyle(
                    fontSize: headLine,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: developers.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(developers[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
