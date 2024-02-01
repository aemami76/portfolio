import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget(this.skills, this.title, {super.key});
  final List skills;
  final String title;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;

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
                    leading: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(skills[index]
                              [0]), // Replace with your image asset
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                skills[index][2].toString().isEmpty ? 8 : 2),
                            child: SizedBox(
                              width: 100,
                              child: Text(
                                skills[index][1],
                              ),
                            ),
                          ),
                        ),

                        ///
                        if (w > 600) ...mobileWidget(skills[index][2], context),

                        ///
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
                    subtitle: w <= 600
                        ? webWidget(skills[index][2], context)
                        : const SizedBox(),
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

List<Widget> mobileWidget(dynamic dynamic, BuildContext context) {
  return [
    if (dynamic.toString().isNotEmpty) const Spacer(),
    if (dynamic.toString().isNotEmpty)
      (dynamic.runtimeType == double) || (dynamic.runtimeType == int)
          ? SliderTheme(
              data: SliderThemeData(
                trackHeight: 15,

                disabledActiveTrackColor:
                    Theme.of(context).colorScheme.onPrimary,

                thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 0.0), // Set thumb shape with radius 0
                overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 20), // Set overlay shape with radius 0
              ),
              child: Slider(
                value: (dynamic! as int).toDouble(),
                onChanged: null,
                max: 100,
              ),
            )
          : const SizedBox(),
    if (dynamic.toString().isNotEmpty)
      const SizedBox(
        width: 8,
      ),
  ];
}

Widget webWidget(dynamic dynamic, BuildContext context) {
  if (dynamic.toString().isNotEmpty &&
      ((dynamic.runtimeType == double) || (dynamic.runtimeType == int))) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 15,

        disabledActiveTrackColor: Theme.of(context).colorScheme.onPrimary,

        thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 0.0), // Set thumb shape with radius 0
        overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 20), // Set overlay shape with radius 0
      ),
      child: Slider(
        value: (dynamic! as int).toDouble(),
        onChanged: null,
        max: 100,
      ),
    );
  }
  return const SizedBox();
}
