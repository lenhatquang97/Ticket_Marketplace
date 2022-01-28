import 'package:flutter/material.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';

class NewWallet extends StatelessWidget {
  const NewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
