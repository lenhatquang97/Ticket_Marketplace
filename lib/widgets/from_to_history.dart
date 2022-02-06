import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/utils/date_time_func.dart';

class FromToHistory extends StatelessWidget {
  final String actionType;
  final String address;
  final String time;
  const FromToHistory(
      {Key? key,
      required this.actionType,
      required this.address,
      required this.time})
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
            Text(
              actionType,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              getTime(DateTime.fromMillisecondsSinceEpoch(int.parse(time))) +
                  " in " +
                  getDate(DateTime.fromMillisecondsSinceEpoch(int.parse(time))),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(address),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
