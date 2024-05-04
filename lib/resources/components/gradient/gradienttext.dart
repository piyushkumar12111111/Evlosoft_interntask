import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final List<Color> colors;

  const GradientText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = LinearGradient(
      colors: colors,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        foreground: Paint()..shader = textGradient,
      ),
    );
  }
}