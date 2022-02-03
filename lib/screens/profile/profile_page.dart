import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/screens/profile/your_ticket.dart';
import 'package:ticket_marketplace/widgets/profile/field_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Your profile",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            FieldButton(
              icon: FontAwesomeIcons.ticketAlt,
              text: "Your tickets",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YourTicket()));
              },
            ),
            FieldButton(
              icon: FontAwesomeIcons.landmark,
              text: "Landmark recognition",
              onPressed: () {},
            ),
            FieldButton(
              icon: FontAwesomeIcons.qrcode,
              text: "Scan QR code",
              onPressed: () {},
            ),
            FieldButton(
              icon: FontAwesomeIcons.infoCircle,
              text: "About",
              onPressed: () {},
            ),
          ],
        ),
      )),
    );
  }
}
