import 'package:json_annotation/json_annotation.dart';
part 'my_ticket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MyTicketModel {
  final String txid;
  final String address;
  final MyTicketData data;
  MyTicketModel(
      {required this.txid, required this.address, required this.data});
  factory MyTicketModel.fromJson(Map<String, dynamic> json) =>
      _$MyTicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyTicketModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyTicketData {
  final String ticketId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String start;
  final String end;
  MyTicketData(
      {required this.ticketId,
      required this.name,
      required this.description,
      required this.location,
      required this.category,
      required this.start,
      required this.end});
  factory MyTicketData.fromJson(Map<String, dynamic> json) =>
      _$MyTicketDataFromJson(json);
  Map<String, dynamic> toJson() => _$MyTicketDataToJson(this);
}
