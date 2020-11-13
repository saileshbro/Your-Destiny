import 'story.dart';

get stories => [
      // The Stranger
      Story(
        title: "s0_title",
        credits: "s0_credits",
        pages: [
          SPage(
            pageIndex: 0,
            text: 's0_p0_text',
            choices: [
              Choice(
                text: 's0_p0_c0',
                pagePointer: 2,
              ),
              Choice(
                text: 's0_p0_c1',
                pagePointer: 1,
              ),
            ],
          ),
          SPage(
            pageIndex: 1,
            text: 's0_p1_text',
            choices: [
              Choice(
                text: 's0_p1_c0',
                pagePointer: 2,
              ),
              Choice(
                text: 's0_p1_c1',
                pagePointer: 3,
              )
            ],
          ),
          SPage(
            pageIndex: 2,
            text: 's0_p2_text',
            choices: [
              Choice(text: 's0_p2_c0', pagePointer: 5),
              Choice(text: 's0_p2_c1', pagePointer: 4)
            ],
          ),
          SPage(
            pageIndex: 3,
            text: 's0_p3_text',
            choices: [
              Choice(text: 's0_p3_c0', pagePointer: null),
            ],
          ),
          SPage(
            pageIndex: 4,
            text: 's0_p4_text',
            choices: [
              Choice(text: 's0_p4_c0', pagePointer: null),
            ],
          ),
          SPage(
            pageIndex: 5,
            text: 's0_p5_text',
            choices: [
              Choice(text: 's0_p5_c0', pagePointer: null),
            ],
          ),
        ],
      ),

      // The Red Letter (https://www.write4fun.net/view-entry/205506)
      // I am using this story as a test to learn more about using GitHub for open
      // source contributions...
      // Credits go to Ben Wreford, Grade 9, Kent Street Senior High School
      Story(
        title: "s1_title",
        credits: "s1_credits",
        pages: [
          SPage(
            pageIndex: 0,
            text: "s1_p0_text",
            choices: [
              Choice(
                text: 's1_p0_c0',
                pagePointer: 2,
              ),
              Choice(
                text: 's1_p0_c1',
                pagePointer: 1,
              ),
            ],
          ),
          SPage(
            pageIndex: 1,
            text: 's1_p1_text',
            choices: [
              Choice(
                text: 's1_p1_c0',
                pagePointer: 0,
              ),
            ],
          ),
          SPage(
            pageIndex: 2,
            text: "s1_p2_text",
            choices: [
              Choice(
                text: 's1_p2_c0',
                pagePointer: 3,
              )
            ],
          ),
          SPage(
            pageIndex: 3,
            text: 's1_p3_text',
            choices: [
              Choice(
                text: 's1_p3_c0',
                pagePointer: 4,
              ),
              Choice(
                text: 's1_p3_c1',
                pagePointer: 5,
              ),
            ],
          ),
          SPage(
            pageIndex: 4,
            text: 's1_p4_text',
            choices: [
              Choice(
                text: 's1_p4_c0',
                pagePointer: 5,
              ),
            ],
          ),
          SPage(
            pageIndex: 5,
            text: 's1_p5_text',
            choices: [
              Choice(text: "s1_p5_c0", pagePointer: null),
            ],
          ),
        ],
      ),
    ];

getStory(int index) {
  return stories[index];
}
