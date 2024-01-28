import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget(this.skills, this.title, {super.key});
  final List skills;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextDivider.horizontal(
            text: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        )),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                              child: Image.asset(
                            skills[index][0],
                            fit: BoxFit.fill,
                          )),
                        ),
                      ],
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                skills[index][2].toString().isEmpty ? 16 : 2),
                            child: Text(
                              skills[index][1],
                            ),
                          ),
                        ),
                        if (skills[index][2].toString().isNotEmpty)
                          const Spacer(),
                        if (skills[index][2].toString().isNotEmpty)
                          skills[index][2].runtimeType == int
                              ? SliderTheme(
                                  data: SliderThemeData(
                                    trackHeight: 15,

                                    disabledActiveTrackColor:
                                        Theme.of(context).colorScheme.onPrimary,

                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius:
                                            0.0), // Set thumb shape with radius 0
                                    overlayShape: const RoundSliderOverlayShape(
                                        overlayRadius:
                                            20), // Set overlay shape with radius 0
                                  ),
                                  child: Slider(
                                    value: skills[index][2],
                                    onChanged: null,
                                    max: 100,
                                  ),
                                )
                              : const SizedBox(),
                        if (skills[index][2].toString().isNotEmpty)
                          const SizedBox(
                            width: 8,
                          ),
                        if (skills[index][2].toString().isNotEmpty)
                          skills[index][2].runtimeType == int
                              ? Text(
                                  '${skills[index][2]}%',
                                )
                              : Text(
                                  skills[index][2],
                                ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
