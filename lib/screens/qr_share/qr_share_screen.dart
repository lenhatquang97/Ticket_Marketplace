import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrShareScreen extends StatelessWidget {
  const QrShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Share your public key",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Share your public key for transferring tickets and other assets",
                textAlign: TextAlign.center,
              ),
            ),
            const Text("Your public key:"),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "04165f8d4a634bb17f847e8d084a0fd09698ada5fadc91c0efa8d8c048b8028b7c5e3a12066c7ebc6ab9cda3785392d7cc4f49cc945e6f7787785ad7f49cba9449",
                textAlign: TextAlign.justify,
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: QrImage(
                  data:
                      "04165f8d4a634bb17f847e8d084a0fd09698ada5fadc91c0efa8d8c048b8028b7c5e3a12066c7ebc6ab9cda3785392d7cc4f49cc945e6f7787785ad7f49cba9449",
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width - 40,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
