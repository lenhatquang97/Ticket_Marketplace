import 'package:flutter/material.dart';
import 'package:ticket_marketplace/models/wallet.dart';
import 'package:ticket_marketplace/screens/new_wallet/confirm_secret_key.dart';
import 'package:ticket_marketplace/utils/wallet.dart';

class ShowSecretKey extends StatefulWidget {
  const ShowSecretKey({Key? key, required this.password}) : super(key: key);
  final String password;

  @override
  State<ShowSecretKey> createState() => _ShowSecretKeyState();
}

class _ShowSecretKeyState extends State<ShowSecretKey> {

  @override
  Widget build(BuildContext context) {
    Wallet wallet = CreateNewWallet(widget.password);
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
            "Secret Recovery Key",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Center(
                  child: Text(
                "WARNING: Never diclose your Secret Key. Anyone with this key can take your Ether forever.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )),
            ),
          ),
          Text(GetPriavteKey(wallet.hashedPrivateKey, widget.password)),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfirmSecretKey(password: widget.password, wallet: wallet,)));
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
                        "Continue",
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
