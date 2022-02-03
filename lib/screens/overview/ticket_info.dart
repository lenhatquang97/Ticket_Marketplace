import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/widgets/custom_expansion_panel.dart';
import 'package:ticket_marketplace/widgets/from_to_history.dart';
import 'package:ticket_marketplace/widgets/icon_with_text.dart';

class TicketInfo extends StatefulWidget {
  const TicketInfo({Key? key}) : super(key: key);

  @override
  State<TicketInfo> createState() => _TicketInfoState();
}

class _TicketInfoState extends State<TicketInfo> {
  var stateExpand = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'test1',
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Image.network(
                      sampleImgUrl,
                    ),
                  ),
                ),
                const Chip(
                  backgroundColor: blueCustom,
                  label: Text(
                    "Concert",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Flirty Bears #0001",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: IconWithText(
                      icon: Icons.place,
                      text: "1st District, Ho Chi Minh City",
                      color: Colors.red,
                      fontSize: 20,
                    )),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: blueGradient)),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.cartArrowDown,
                              color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Buy now',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomExpansionPanelList(
                  expansionCallback: (i, open) {
                    setState(() {
                      stateExpand[i] = !stateExpand[i];
                    });
                  },
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: stateExpand[0],
                      backgroundColor: blueCustom,
                      headerBuilder: (context, isOpen) {
                        return const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        );
                      },
                      body: const Padding(
                        padding:
                            EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        child: Text("Sample", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: stateExpand[1],
                      backgroundColor: blueCustom,
                      headerBuilder: (context, isOpen) {
                        return const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        );
                      },
                      body: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "He ordered his regular breakfast. Two eggs sunnyside up, hash browns, and two strips of bacon. He continued to look at the menu wondering if this would be the day he added something new. This was also part of the routine. A few seconds of hesitation to see if something else would be added to the order before demuring and saying that would be all. It was the same exact meal that he had ordered every day for the past two years.",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: stateExpand[2],
                      backgroundColor: blueCustom,
                      headerBuilder: (context, isOpen) {
                        return const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("History",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        );
                      },
                      body: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            FromToHistory(
                                fromWallet: "0x284845787",
                                toWallet: "0x188282383",
                                timeStamp: "28/1/2022"),
                            FromToHistory(
                                fromWallet: "0x284845787",
                                toWallet: "0x188282383",
                                timeStamp: "28/1/2022"),
                            FromToHistory(
                                fromWallet: "0x284845787",
                                toWallet: "0x188282383",
                                timeStamp: "28/1/2022")
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
