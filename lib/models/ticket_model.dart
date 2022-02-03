import 'package:ticket_marketplace/models/history_model.dart';

class TicketModel {
  final String ownedBy;
  final String id;
  final String name;
  final String description;
  final String location;
  final String category;
  final DateTime start;
  final DateTime end;
  final String imageUrl;
  final List<History> histories;
  const TicketModel(
      {required this.ownedBy,
      required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.category,
      required this.start,
      required this.end,
      required this.imageUrl,
      required this.histories});
}
