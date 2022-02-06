import 'package:flutter/material.dart';
import 'package:ticket_marketplace/bloc/histories_bloc.dart';
import 'package:ticket_marketplace/models/wrapper_history.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:ticket_marketplace/widgets/from_to_history.dart';

class ShowFullHistory extends StatefulWidget {
  final String ticketId;
  const ShowFullHistory({Key? key, required this.ticketId}) : super(key: key);

  @override
  _ShowFullHistoryState createState() => _ShowFullHistoryState();
}

class _ShowFullHistoryState extends State<ShowFullHistory> {
  @override
  void initState() {
    super.initState();
    historyBloc.getHistoriesFunc(widget.ticketId);
  }

  final historyBloc = HistoryBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: StreamBuilder<List<WrapperHistory>>(
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
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: snapshot.data!
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FromToHistory(
                                    actionType: e.action,
                                    address: e.eachHistory.data.address,
                                    time: e.eachHistory.data.time),
                              ))
                          .toList()),
                ),
              );
            }),
      ),
    );
  }
}
