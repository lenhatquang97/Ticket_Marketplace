import 'dart:convert';
import 'package:ecdsa/src/signature.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/screens/new_wallet/new_wallet.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_marketplace/widgets/password_field.dart';

class ConfirmSharing extends StatelessWidget {
  ConfirmSharing({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101018),
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Confirm your activity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Do you want to confirm your activity?",
            ),
            Lottie.asset("assets/lottie_anim/confirmation.json"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PasswordField(
                onChanged: (val) {},
                controller: controller,
                lable: "Password",
                validator: (value) {
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                Navigator.pop(context, controller.text);
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
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
