import 'package:flutter/material.dart';

/*  A simple credits page was created in order to
highlight the creators of the story and the developers that worked on the project
  -Rift3000 */

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double headLine = 35.0;
    double regularText = 20.0;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 45.0,
            ),
            Text(
              "Story Credits",
              style: TextStyle(
                fontSize: headLine,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "The Stranger from AppBrewry's\n Flutter Development Course",
              style: TextStyle(fontSize: regularText),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "The Red Letter by \nBen Wreford Grade 9, \nKent Street Senior High School",
              style: TextStyle(fontSize: regularText),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "The Kind Klown inspired by\n Stephen King's I.T",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Developers",
              style: TextStyle(
                fontSize: headLine,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Tragikomedes",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "hansxkokx",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "ion05",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "goober0329",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Rift3000",
              style: TextStyle(
                fontSize: regularText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
