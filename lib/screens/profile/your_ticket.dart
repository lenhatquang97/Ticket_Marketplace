import 'package:flutter/material.dart';
import 'package:ticket_marketplace/bloc/my_ticket_bloc.dart';
import 'package:ticket_marketplace/models/my_ticket_model.dart';
import 'package:ticket_marketplace/screens/subtile/no_item_available.dart';
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
            child: StreamBuilder<List<MyTicketModel>>(
                stream: ownTicBloc.ownTickets,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return const NoItemAvailables();
                  }
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.map((e) => Ticket(model: e)).toList(),
                  );
                })),
      ),
    );
  }
}
