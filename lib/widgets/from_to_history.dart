import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FromToHistory extends StatelessWidget {
  final String fromWallet;
  final String toWallet;
  final String timeStamp;
  const FromToHistory(
      {Key? key,
      required this.fromWallet,
      required this.toWallet,
      required this.timeStamp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.exchangeAlt,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Transfer",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              timeStamp,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text("From: $fromWallet", style: const TextStyle(fontSize: 18)),
        Text("To: $toWallet", style: const TextStyle(fontSize: 18)),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
