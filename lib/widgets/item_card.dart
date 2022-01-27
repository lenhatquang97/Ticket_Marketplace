import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/widgets/icon_with_text.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final String like;
  const ItemCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.like,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 5,
      child: Card(
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
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Text(title),
              const SizedBox(
                height: 5,
              ),
              Text(description,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWithText(
                    icon: FontAwesomeIcons.ethereum,
                    text: price,
                  ),
                  const Spacer(),
                  IconWithText(
                    icon: FontAwesomeIcons.heart,
                    text: like,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
