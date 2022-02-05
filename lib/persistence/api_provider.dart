import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';

class ApiProvider {
  Future<List<TicketModel>> fetchAllTickets() async {
    final response = await http.get(Uri.parse(getAllTickets));
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body)['data'] as List<dynamic>;
      return val.map((e) => TicketModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ticket');
    }
  }

  Future<List<dynamic>> readCategoriesJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/categories.json');
    final data = await jsonDecode(response);
    return data;
  }

  Future<int> buyfromStore(String ticketId, String address) async {
    final response = await http.patch(Uri.parse(getAllTickets),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'ticketId': ticketId, 'address': address}));
    return response.statusCode;
  }
}
