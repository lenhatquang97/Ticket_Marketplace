import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Wrap(
        children: [
          Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: [
                  Image.network(
                    "https://lh3.googleusercontent.com/bUXCoCysa9XI_T_ZSdWxa1rXkTgr8yMnehVyB3NApMr7E8cvDDmC82wJi8OgbyQ4OLxMS1gj7Pt1pI4Hd8uYym_LiwTspipNzp7D=w600",
                    fit: BoxFit.fill,
                    height: 200,
                    width: 300,
                  ),
                  const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "Concert",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
