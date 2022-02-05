import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;
  const CategoryCard({Key? key, required this.category, required this.imageUrl})
      : super(key: key);

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
                    imageUrl,
                    fit: BoxFit.fill,
                    height: 200,
                    width: 300,
                  ),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        category,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
