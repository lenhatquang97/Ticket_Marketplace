import 'package:json_annotation/json_annotation.dart';
part 'ticket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TicketModel {
  final String txid;
  final String address;
  final TicketData data;
  const TicketModel(
      {required this.txid, required this.address, required this.data});
  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TicketData {
  final String ticketId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String start;
  final String end;
  //const with required
  const TicketData({
    required this.ticketId,
    required this.name,
    required this.description,
    required this.location,
    required this.category,
    required this.start,
    required this.end,
  });
  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);
  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}
