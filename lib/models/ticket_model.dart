import 'package:json_annotation/json_annotation.dart';
part 'ticket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TicketModel {
  final String txid;
  final String ticketId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String start;
  final String end;
  final String price;
  //const with required
  const TicketModel(
      {required this.txid,
      required this.ticketId,
      required this.name,
      required this.description,
      required this.location,
      required this.category,
      required this.start,
      required this.end,
      required this.price});
  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}
