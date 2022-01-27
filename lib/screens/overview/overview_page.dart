import 'package:flutter/material.dart';
import 'package:ticket_marketplace/widgets/item_card.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(5),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Hot new items",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Wrap(
                  children: const [
                    ItemCard(
                      imageUrl:
                          "https://lh3.googleusercontent.com/WwYd8uvCYPoNIFzENIqvaqWqHRBl82y3zSBNIiHor_529YFXMy_fT889BAWC987Kb3qLahffUNOb7rPFsZM3CC7C=s0",
                      title: "Plasma Bears",
                      description: "Flirty Bear",
                      price: "0.5",
                      like: "100",
                    ),
                    ItemCard(
                      imageUrl:
                          "https://lh3.googleusercontent.com/WwYd8uvCYPoNIFzENIqvaqWqHRBl82y3zSBNIiHor_529YFXMy_fT889BAWC987Kb3qLahffUNOb7rPFsZM3CC7C=s0",
                      title: "Plasma Bears",
                      description: "Flirty Bear",
                      price: "0.5",
                      like: "100",
                    ),
                    ItemCard(
                      imageUrl:
                          "https://lh3.googleusercontent.com/WwYd8uvCYPoNIFzENIqvaqWqHRBl82y3zSBNIiHor_529YFXMy_fT889BAWC987Kb3qLahffUNOb7rPFsZM3CC7C=s0",
                      title: "Plasma Bears",
                      description: "Flirty Bear",
                      price: "0.5",
                      like: "100",
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
