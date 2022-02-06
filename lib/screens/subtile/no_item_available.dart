import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoItemAvailables extends StatelessWidget {
  const NoItemAvailables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(height: 20),
      Text(
        'No items available',
        style: Theme.of(context).textTheme.headline6,
      ),
      Lottie.asset("assets/lottie_anim/no-ticket.json"),
      const SizedBox(height: 20),
      Text(
        'Please check back later',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ]);
  }
}
