import 'package:flutter/material.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/widgets/icon_with_text.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final TicketModel model;
  const ItemCard({Key? key, required this.model, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: Card(
        color: const Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(model.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Chip(
                      backgroundColor: blueCustom,
                      label: Text(
                        model.category,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icons.place,
                        color: Colors.red,
                        text: model.location),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
