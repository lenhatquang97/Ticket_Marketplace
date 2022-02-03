import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';

class FieldButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const FieldButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: blueGradient)),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              FaIcon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              const FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
