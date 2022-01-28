import 'package:flutter/material.dart';

class TicketInfo extends StatelessWidget {
  const TicketInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Image.network(
                  "https://lh3.googleusercontent.com/WwYd8uvCYPoNIFzENIqvaqWqHRBl82y3zSBNIiHor_529YFXMy_fT889BAWC987Kb3qLahffUNOb7rPFsZM3CC7C=s0",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Flirty Bears",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "He ordered his regular breakfast. Two eggs sunnyside up, hash browns, and two strips of bacon. He continued to look at the menu wondering if this would be the day he added something new. This was also part of the routine. A few seconds of hesitation to see if something else would be added to the order before demuring and saying that would be all. It was the same exact meal that he had ordered every day for the past two years.",
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
