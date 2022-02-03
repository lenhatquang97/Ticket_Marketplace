import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/screens/overview/ticket_info.dart';
import 'package:ticket_marketplace/widgets/category_card.dart';
import 'package:ticket_marketplace/widgets/item_card.dart';
import 'package:ticket_marketplace/widgets/ticket_shape.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "T A I B A W A L L E T",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
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
                CarouselSlider(
                  options: CarouselOptions(height: 220),
                  items: const [CategoryCard(), CategoryCard(), CategoryCard()],
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "All items",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TicketInfo()))
                      },
                      child: const Hero(
                        tag: 'test1',
                        child: ItemCard(
                          imageUrl: sampleImgUrl,
                          title: "Flirty Bear",
                          location: "Vietnam",
                        ),
                      ),
                    ),
                    const ItemCard(
                      imageUrl: sampleImgUrl,
                      title: "Flirty Bear",
                      location: "Vietnam",
                    ),
                    const ItemCard(
                      imageUrl: sampleImgUrl,
                      title: "Flirty Bear",
                      location: "Vietnam",
                    ),
                    const ItemCard(
                      imageUrl: sampleImgUrl,
                      title: "Flirty Bear",
                      location: "Vietnam",
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
