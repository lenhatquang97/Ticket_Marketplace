import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticket_marketplace/bloc/categories_bloc.dart';
import 'package:ticket_marketplace/bloc/ticket_bloc.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/screens/overview/item_filter_by_category.dart';
import 'package:ticket_marketplace/screens/overview/ticket_info.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:ticket_marketplace/widgets/category_card.dart';
import 'package:ticket_marketplace/widgets/item_card.dart';
import 'package:http/http.dart' as http;

class OverviewPage extends StatefulWidget {
  OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();
    ticketBloc.fetchAllTickets();
    categoriesBloc.readCategoriesJson();
  }

  final ticketBloc = TicketBloc();
  final categoriesBloc = CategoriesBloc();

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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                StreamBuilder<List<dynamic>>(
                    stream: categoriesBloc.categories,
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
                      return CarouselSlider(
                        options: CarouselOptions(height: 220),
                        items: snapshot.data!
                            .map((e) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilterByCategory(
                                                  category: e['category'],
                                                )));
                                  },
                                  child: CategoryCard(
                                    category: e['category'],
                                    imageUrl: e['imageUrl'],
                                  ),
                                ))
                            .toList(),
                      );
                    }),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "All items",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
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
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: snapshot.data!
                            .map((e) => InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TicketInfo(
                                                  model: e,
                                                )))
                                  },
                                  child: ItemCard(
                                    model: e,
                                    imageUrl: sampleImgUrl,
                                  ),
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
