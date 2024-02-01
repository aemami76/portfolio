import 'package:flutter/material.dart';
import 'package:portfolio/widgets/skill_widget.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
              duration: const Duration(milliseconds: 300),
              child: const Text('More About Me!'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
                color: isExpanded
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: Duration.zero,
                  firstChild: const FirstChild(),
                  secondChild: const Text(''),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SkillWidget(personal, 'Soft Skills'),
        SkillWidget(tech, 'Summery'),
        SkillWidget(skills, 'Skills'),
        SkillWidget(edj, 'Education'),
        SkillWidget(military, 'Military service'),
        SkillWidget(work, 'Work Experience'),
        SkillWidget(lng, 'Language')
      ],
    );
  }
}

const List tech = [
  [
    'assets/skill.png',
    '  Freelance Dart and Flutter developer, adept in Git and GitHub version control. Experienced in crafting applications leveraging responsive design principles. Proficient in implementing adaptive UI, reactive UI, and reusable widget patterns. Skilled in managing HTTP requests, handling JSON, and integrating RESTful APIs. Well-versed in both GetX and Riverpod libraries.',
    '',
  ]
];

const List personal = [
  [
    'assets/me.jpg',
    '   Diligent and detail-oriented professional with a strong work ethic. Consistently meets deadlines and delivers high-quality results. Known for reliability, hard work, and trustworthiness. A proactive and dedicated team player committed to achieving organizational goals.',
    ''
  ]
];

const List lng = [
  ['assets/eng.png', 'English', 75]
];

const List skills = [
  ['assets/dart.png', 'Dart', 80],
  ['assets/flutter.png', 'Flutter', 80],
  ['assets/figma.png', 'Figma', 60],
  ['assets/firebase.png', 'Firebase', 75],
  ['assets/photoshop.png', 'Photoshop', 75],
  ['assets/python.png', 'Python', 35],
  ['assets/git.png', 'Git', 75],
];
const List edj = [
  ['assets/tehran.png', 'Mec Eng at UT', '2017-2021'],
];

const List military = [
  ['assets/soldier.png', '2022-2023', 'Done'],
];

const List work = [
  ['assets/iku.png', 'IK university', '2022-2023'],
  ['assets/freelancer.png', 'freelancer', '2023-Now'],
];
