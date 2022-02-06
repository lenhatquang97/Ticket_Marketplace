import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_marketplace/bloc/histories_bloc.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/models/wrapper_history.dart';
import 'package:ticket_marketplace/persistence/api_provider.dart';
import 'package:ticket_marketplace/persistence/repository.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:ticket_marketplace/utils/date_time_func.dart';
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
  @override
  void initState() {
    super.initState();
    historyBloc.getHistoriesFunc(widget.model.ticketId);
  }

  final historyBloc = HistoryBloc();
  var stateExpand = [false, false, false];
  Completer<GoogleMapController> _controller = Completer();
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
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start",
                          style: blackColorFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getTime(widget.model.start.contains('-')
                              ? DateTime.parse(widget.model.start)
                              : DateTime.now()),
                          style: blackColorFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getDate(widget.model.start.contains('-')
                              ? DateTime.parse(widget.model.start)
                              : DateTime.now()),
                          style: blackColorFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const FaIcon(
                      FontAwesomeIcons.ticketAlt,
                      color: blueCustom,
                      size: 20,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End",
                            style: blackColorFont.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getTime(widget.model.end.contains('-')
                              ? DateTime.parse(widget.model.end)
                              : DateTime.now()),
                          style: blackColorFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getDate(widget.model.end.contains('-')
                              ? DateTime.parse(widget.model.end)
                              : DateTime.now()),
                          style: blackColorFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
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
                        child: FutureBuilder<Pair>(
                            future:
                                Repository().getLocation(widget.model.location),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                return const Icon(Icons.error);
                              }
                              print(LatLng(snapshot.data!.a, snapshot.data!.b));
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 1.25,
                                height: MediaQuery.of(context).size.height / 2,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          snapshot.data!.a, snapshot.data!.b),
                                      zoom: 10),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              );
                            }),
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
                      body: StreamBuilder<List<WrapperHistory>>(
                          stream: historyBloc.historyStream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return const Center(
                                child: Icon(Icons.error),
                              );
                            }
                            return Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: snapshot.data!
                                      .map((e) => FromToHistory(
                                          actionType: e.action,
                                          address: e.eachHistory.data.address,
                                          time: e.eachHistory.data.time))
                                      .toList()),
                            );
                          }),
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
