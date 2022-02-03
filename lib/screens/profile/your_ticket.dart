import 'package:flutter/material.dart';
import 'package:ticket_marketplace/widgets/ticket_shape.dart';

class YourTicket extends StatelessWidget {
  const YourTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [Ticket(), Ticket(), Ticket()],
        )),
      ),
    );
  }
}
