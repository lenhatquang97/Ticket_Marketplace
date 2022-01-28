import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const IconWithText(
      {Key? key, required this.icon, required this.text, required this.color})
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
        Text(text),
      ],
    );
  }
}
