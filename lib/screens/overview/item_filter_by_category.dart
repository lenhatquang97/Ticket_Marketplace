import 'package:flutter/material.dart';
import 'package:ticket_marketplace/bloc/ticket_bloc.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/screens/overview/ticket_info.dart';
import 'package:ticket_marketplace/screens/subtile/no_item_available.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:ticket_marketplace/widgets/item_card.dart';
import 'package:http/http.dart' as http;

class FilterByCategory extends StatefulWidget {
  final String category;
  const FilterByCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<FilterByCategory> createState() => _FilterByCategoryState();
}

class _FilterByCategoryState extends State<FilterByCategory> {
  @override
  void initState() {
    super.initState();
    ticketBloc.fetchAllTickets();
  }

  final ticketBloc = TicketBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(5),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Filter by ${widget.category}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                StreamBuilder<List<TicketModel>>(
                    stream: ticketBloc.allTickets,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Error"),
                        );
                      }
                      final tickets = snapshot.data!.where((element) =>
                          element.category == widget.category ||
                          element.category == widget.category.toLowerCase());
                      if (tickets.isEmpty) {
                        return const NoItemAvailables();
                      }
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: tickets
                            .map((e) => InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TicketInfo(
                                                  model: e,
                                                )))
                                  },
                                  child: ItemCard(model: e),
                                ))
                            .toList(),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
