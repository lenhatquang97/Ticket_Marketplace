import 'package:flutter/material.dart';
import 'package:ticket_marketplace/bloc/my_ticket_bloc.dart';
import 'package:ticket_marketplace/widgets/ticket_shape.dart';

class YourTicket extends StatefulWidget {
  const YourTicket({Key? key}) : super(key: key);

  @override
  State<YourTicket> createState() => _YourTicketState();
}

class _YourTicketState extends State<YourTicket> {
  void initState() {
    super.initState();
    ownTicBloc.fetchOwnTickets();
  }

  final ownTicBloc = MyTicketBloc();
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
