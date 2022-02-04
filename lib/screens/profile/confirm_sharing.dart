import 'dart:convert';
import 'package:ecdsa/src/signature.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:http/http.dart' as http;

class ConfirmSharing extends StatelessWidget {
  final String receiverPublicId;
  final String txOutId;
  final Signature signaturer;
  const ConfirmSharing(
      {Key? key,
      required this.receiverPublicId,
      required this.txOutId,
      required this.signaturer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101018),
      appBar: CustomAppbar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Confirm your transaction",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Do you want to transfer to another account?",
            ),
            Expanded(
              child: Lottie.asset("assets/lottie_anim/confirmation.json"),
            ),
            InkWell(
              onTap: () async {
                final send = await http.post(Uri.parse(createTransaction),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'txOutId': txOutId,
                      'address': receiverPublicId,
                      'signature': signaturer.toString()
                    }));
                if (send.statusCode == 200) {
                  Navigator.pop(context);
                } else {
                  print(send.body);
                  print("Oh no!!");
                }
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
                      "Yes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).secondaryHeaderColor),
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Center(
                        child: Text(
                      "No",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor),
                    )),
                  ),
                )),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
