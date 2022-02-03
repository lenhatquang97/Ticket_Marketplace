import 'package:flutter/material.dart';
import 'package:ticket_marketplace/models/wallet.dart';

class ConfirmSecretKey extends StatefulWidget {
  const ConfirmSecretKey({Key? key, required this.password, required this.wallet}) : super(key: key);

  final String password;
  final Wallet wallet;

  @override
  State<ConfirmSecretKey> createState() => _ConfirmSecretKeyState();
}

class _ConfirmSecretKeyState extends State<ConfirmSecretKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            "Confirm your Secret Key",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Center(
                  child: Text(
                "Please enter your secret key in order to make sure it correct.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )),
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ConfirmSecretKey(password: widget.password, wallet: wallet,)));
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Color(0xff0049e4),
                    borderRadius: BorderRadius.circular(29)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text(
                        "Confirm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  )),
                )),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
