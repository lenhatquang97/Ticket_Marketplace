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
                "Share your ticket",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Share your ticket with your friends and family only through scanning your QR ticket code",
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                color: Colors.white,
                child: QrImage(
                  data: "10202",
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
