import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

class WriteTextAnimation extends StatelessWidget {
  const WriteTextAnimation(this.text,
      {this.ms = 150,
      this.ta = TextAlign.center,
      this.repeatable = true,
      super.key});
  final String text;
  final int ms;
  final TextAlign ta;
  final bool repeatable;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(text,
            textAlign: ta, speed: Duration(milliseconds: ms))
      ],
      displayFullTextOnTap: true,
      stopPauseOnTap: false,
      isRepeatingAnimation: repeatable,
      repeatForever: true,
    );
  }
}
