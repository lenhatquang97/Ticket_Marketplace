import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/persistence/repository.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:ticket_marketplace/screens/profile/confirm_sharing.dart';
import 'package:ticket_marketplace/utils/user_storage.dart';
import 'package:ticket_marketplace/utils/wallet.dart';
import 'package:ticket_marketplace/widgets/custom_expansion_panel.dart';
import 'package:ticket_marketplace/widgets/from_to_history.dart';
import 'package:ticket_marketplace/widgets/icon_with_text_custom.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TicketInfo extends StatefulWidget {
  final TicketModel model;
  const TicketInfo({Key? key, required this.model}) : super(key: key);

  @override
  State<TicketInfo> createState() => _TicketInfoState();
}

class _TicketInfoState extends State<TicketInfo> {
  var stateExpand = [false, false, false];
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
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
                FutureBuilder<String>(
                    future: Repository().getImageLink(widget.model.ticketId),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return const Icon(Icons.error);
                      }
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Image.network(
                          snapshot.data!,
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                Chip(
                  backgroundColor: blueCustom,
                  label: Text(
                    widget.model.category,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(widget.model.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: IconWithTextCustom(
                      icon: Icons.place,
                      text: widget.model.location,
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
                    onTap: () async {
                      final repo = Repository();
                      final address = await SecureStorage.readSecureData(
                          SecureStorage.publicKey);
                      final resultCode = await repo.buyfromStore(
                          widget.model.ticketId, address);
                      if (resultCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Buy successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Buy failed"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
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
                      body: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, bottom: 10),
                        child: GoogleMap(
                          mapType: MapType.terrain,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
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
                          widget.model.description,
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
