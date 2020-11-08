import 'story.dart';

var stories = [
  Story(
    title: "s0_title",
    story: Pages(
      pages: [
        Page(
          page: 0,
          text:
              's0_p0_text',
          choices: Choices(
              first: 's0_p0_c0',
              second: 's0_p0_c1'),
        ),
        Page(
          page: 1,
          text: 's0_p1_text',
          choices: Choices(
              first: 's0_p1_c0',
              second: 's0_p1_c1'),
            ),
        Page(
          page: 2,
          text:
              's0_p2_text',
          choices: Choices(
              first: 's0_p2_c0',
              second: 's0_p2_c1'),),
        Page(
          page: 3,
          text: 's0_p3_text',
          choices: Choices(
            first: 's0_p3_c0',
          ),),
        Page(
          page: 4,
          text:
              's0_p4_text',
          choices: Choices(
            first: 's0_p4_c0',
          ),),
        Page(
          page: 5,
          text: 's0_p5_text',
          choices: Choices(
            first: 's0_p5_c0',
          ),),
      ],
    ),
  ),
];

getStory(title) {
  return stories[0];
}