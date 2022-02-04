import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/widgets/custom_expansion_panel.dart';
import 'package:ticket_marketplace/widgets/from_to_history.dart';
import 'package:ticket_marketplace/widgets/icon_with_text.dart';
import 'package:ticket_marketplace/widgets/icon_with_text_custom.dart';

class TicketInfo extends StatefulWidget {
  final TicketModel model;
  const TicketInfo({Key? key, required this.model}) : super(key: key);

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
                Card(
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
                const SizedBox(
                  height: 10,
                ),
                Chip(
                  backgroundColor: blueCustom,
                  label: Text(
                    widget.model.data.category,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(widget.model.data.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: IconWithTextCustom(
                      icon: Icons.place,
                      text: widget.model.data.location,
                      color: Colors.red,
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
                                  fontWeight: FontWeight.bold, fontSize: 20)),
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
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: Text(
                          widget.model.data.description,
                          textAlign: TextAlign.justify,
                        ),
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
                                  fontWeight: FontWeight.bold, fontSize: 20)),
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
