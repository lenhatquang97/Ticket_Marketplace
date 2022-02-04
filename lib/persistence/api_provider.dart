import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';

class ApiProvider {
  Future<List<TicketModel>> fetchAllTickets() async {
    final response = await http.get(Uri.parse(getAllTickets));
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body) as List<dynamic>;
      return val.map((e) => TicketModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ticket');
    }
  }
}
