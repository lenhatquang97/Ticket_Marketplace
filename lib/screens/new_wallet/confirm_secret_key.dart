import 'package:flutter/material.dart';
import 'package:ticket_marketplace/models/wallet.dart';
import 'package:ticket_marketplace/utils/wallet.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';

class ConfirmSecretKey extends StatefulWidget {
  const ConfirmSecretKey(
      {Key? key, required this.password, required this.wallet})
      : super(key: key);

  final String password;
  final Wallet wallet;

  @override
  State<ConfirmSecretKey> createState() => _ConfirmSecretKeyState();
}

class _ConfirmSecretKeyState extends State<ConfirmSecretKey> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(),
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
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                validator: (value) {
                  if (value != widget.wallet.privateKey) {
                    return "Key doesn't match";
                  }
                  return null;
                },
                controller: controller,
                maxLines: 6,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    errorStyle: const TextStyle(fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              final temp = EncryptPrivateKey(
                  widget.wallet.privateKey, widget.password);
              DecryptPrivateKey(temp, widget.password);

              if (formKey.currentState!.validate()) {
                print(EncryptPrivateKey(widget.wallet.privateKey, widget.password));
              }

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ConfirmSecretKey(password: widget.password, wallet: wallet,)));
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: const Color(0xff0049e4),
                    borderRadius: BorderRadius.circular(29)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text(
                    "Confirm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                )),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
