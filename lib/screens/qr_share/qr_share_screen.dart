import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrShareScreen extends StatelessWidget {
  const QrShareScreen({Key? key}) : super(key: key);
  final String tmpPub =
      "046f3f9a0c6ca20d526d4414ddb21d2798c3976739310170214a984fc0319588f1d63169f9079af8afc331ed8813e57343440b7a2457004d6d11b43d3f68b5dfca";
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                tmpPub,
                textAlign: TextAlign.justify,
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: QrImage(
                  data: tmpPub,
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
