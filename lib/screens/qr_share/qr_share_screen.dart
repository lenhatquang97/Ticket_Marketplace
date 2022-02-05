import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrShareScreen extends StatelessWidget {
  final String publicKey;
  const QrShareScreen({Key? key, required this.publicKey}) : super(key: key);
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
                publicKey,
                textAlign: TextAlign.justify,
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: QrImage(
                  data: publicKey,
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
