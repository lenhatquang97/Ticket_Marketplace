import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double fontSize;
  const IconWithText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
