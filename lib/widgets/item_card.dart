import 'package:flutter/material.dart';
import 'package:ticket_marketplace/widgets/icon_with_text.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String location;
  const ItemCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: Card(
        color: const Color(0xff0f0b27),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color(0xff0f0b27),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.network(
                  imageUrl,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 5,
              ),
              const Chip(
                avatar: Icon(
                  Icons.local_offer,
                  size: 20,
                  color: Colors.green,
                ),
                backgroundColor: Color(0xff7c40a9),
                label: Text(
                  "Concert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              IconWithText(icon: Icons.place, color: Colors.red, text: location)
            ],
          ),
        ),
      ),
    );
  }
}
