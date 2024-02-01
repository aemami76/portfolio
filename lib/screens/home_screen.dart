import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_widget.dart';
import 'package:portfolio/widgets/contact_url_widget.dart';
import 'package:portfolio/widgets/projects_widget.dart';
import 'package:portfolio/widgets/write_text_animation.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:text_divider/text_divider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int w = MediaQuery.sizeOf(context).width.toInt();
    int h = MediaQuery.sizeOf(context).height.toInt();

    launchURL() async {
      final url = Uri.parse(cvUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch url';
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const WriteTextAnimation('Amir Mohammad Emami Portfolio!'),
          actions: [
            IconButton(
                onPressed: launchURL,
                icon: const Icon(Icons.download_for_offline_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0 + h * 0.02, horizontal: 8 + w * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: w / 8,
                          backgroundImage: const AssetImage('assets/me.jpg'),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        OutlinedButton.icon(
                          onPressed: launchURL,
                          icon: const Icon(Icons.download_for_offline_outlined),
                          label: const Text('Resume'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8 + w / 10,
                    ),
                    Expanded(
                      child: RichText(text: textSpan),
                    ),
                  ],
                ),

                SizedBox(
                  height: 8 + h / 12,
                ),
                const AboutWidget(),

                ///
                ///Contact info Box
                ///
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8),
                  child: TextDivider(text: Text('Contact Info')),
                ),
                w > 600
                    ? Column(
                        children: [
                          Row(
                            children: [
                              ContactUrlWidget(
                                  text: 'github',
                                  icon: SimpleIcons.github,
                                  url: urls[0]),
                              const Spacer(),
                              ContactUrlWidget(
                                text: 'telegram',
                                icon: SimpleIcons.telegram,
                                url: urls[3],
                                ltr: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              ContactUrlWidget(
                                text: 'Linkdin',
                                icon: SimpleIcons.linkedin,
                                url: urls[1],
                              ),
                              const Spacer(),
                              ContactUrlWidget(
                                text: 'Email',
                                icon: SimpleIcons.gmail,
                                url: urls[2],
                                ltr: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ContactUrlWidget(
                              text: 'github',
                              icon: SimpleIcons.github,
                              url: urls[0]),
                          const SizedBox(
                            height: 8,
                          ),
                          ContactUrlWidget(
                            text: 'telegram',
                            icon: SimpleIcons.telegram,
                            url: urls[3],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ContactUrlWidget(
                            text: 'Linkdin',
                            icon: SimpleIcons.linkedin,
                            url: urls[1],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ContactUrlWidget(
                            text: 'Email',
                            icon: SimpleIcons.gmail,
                            url: urls[2],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8),
                  child: TextDivider(text: Text('Projects')),
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 8,
                            crossAxisCount: 2),
                    itemCount: myProjects.length,
                    itemBuilder: (context, index) {
                      return ProjectWidget(myProjects[index]);
                    }),
                const Divider(),
                const Text('Powered by Emami')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List myProjects = [
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/cv.jpg',
    'Portfolio Website',
    'Crafted with Flutter, this portfolio website boasts a responsive UI and clean architecture. Using packages like animated text kit, simple icons, and cached network image, it ensures engaging visuals. With PWA export, the site delivers a seamless, installable experience, all hosted on GitHub for collaborative development.',
    'https://github.com/aemami76/portfolio',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/twitch.png',
    'Twitch Clone (a video calling app)',
    'Designed and developed a Flutter/Dart app mirroring Twitch, seamlessly integrating Firebase for real-time chat, database, and authentication. Utilized Agora for robust video streaming and optimized functionality with key packages: dotted border, video player, agora rtc engine, and permission handler.',
    'https://github.com/aemami76/twitch',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/Instagram.png',
    'Instagram clone',
    'Develop an Instagram-inspired app with Firebase as the robust backend, utilizing streams for a responsive frontend. Leveraging key libraries, including "firebase_auth", "cloud_firestore" and "flutter_staggered_grid_view" ensures a professional and feature-rich application seamlessly blending design and functionality. This app can be run in Android, IOS and web.',
    'https://github.com/aemami76/instagram',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/supa.png',
    'Chat App with Supabase',
    'Craft a principled chat app using Supabase instead of Firebase amid industry concerns. Enhance user experience with "timeago" for sleek timestamps and "supabase_flutter" for seamless frontend-backend integration.',
    'https://github.com/aemami76/chat_app',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/tiktok.webp',
    'Tiktok Clone',
    'A dynamic project using Firebase and Firestore for backend and database, GetX for efficient state management, and integrate "image_picker," "video_player," and "permission_handler" libraries for a seamless, user-centric experience.',
    'https://github.com/aemami76/tiktok',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/sea.jpg',
    'Sea Handbook:',
    'A project for ‘I.R.I.naval academy’.In two version of English & Persian with capacity of download & reading PDF, downloading & Streaming Video using restful API & http request.',
    '',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/marinus.png',
    'Marine Book',
    'A project for ‘Khark university’. same as the last project, But with better and Responsive UI using Figma.',
    '',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/location.png',
    'My Favorite Locations',
    'A simple Flutter project by using device’s native component like Camera & GPS using Restful API , json and reusable widgets. powered by riverpod State management. Which Store SQL data using sqflitePackage. With clean architecture.',
    '',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/expense.webp',
    'Expense Tracker',
    'A simple Flutter project using Responsive, Adaptive UI and Dismissible widgets. with Clean Architecture. With 4 different themes.',
    'https://github.com/aemami76/expence_tracker',
    ''
  ],
  [
    'https://raw.githubusercontent.com/aemami76/projects/main/New%20folder/god.png',
    'God Choice',
    'A simple Flutter project powered by GetX micro-framework.',
    'https://github.com/aemami76/god_choice',
    ''
  ]
];

const textSpan = TextSpan(
  style: TextStyle(color: Colors.black),
  children: [
    TextSpan(
        text: 'Amir Mohammad Emami\n\n',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        )),
    TextSpan(text: 'Flutter/Dart Developer\n'),
    TextSpan(text: 'Mechanical Engineer at Tehran University\n\n'),
    TextSpan(
        text: '\n\n1997/12/22 - 27 years old\n',
        style: TextStyle(fontWeight: FontWeight.w600)),
  ],
);

const List<String> urls = [
  'https://github.com/aemami76',
  'https://www.linkedin.com/in/amirmohammad-emami-00aba0194/',
  'emami9331644@gmail.com',
  'https://t.me/sir_emami',
];

const String cvUrl =
    'https://github.com/aemami76/files/blob/9274322e0a9c0775d598692c3af012fbc4b4dffd/emamiCV.pdf';
