import 'dart:convert';
import 'package:ecdsa/ecdsa.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/models/my_ticket_model.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/utils/user_storage.dart';

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
    print(response.body);
    return response.statusCode;
  }

  Future<int> createTransactionFunc(
      String txOutId, String receiverPublicId, Signature signaturer) async {
    final send = await http.post(Uri.parse(createTransaction),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'txOutId': txOutId,
          'address': receiverPublicId,
          'signature': signaturer.toString()
        }));
    print(send.body);
    return send.statusCode;
  }

  Future<List<MyTicketModel>> fetchOwnTickets() async {
    final pubKey = await SecureStorage.readSecureData(SecureStorage.publicKey);
    final response = await http.get(Uri.parse(uxToPubKey + pubKey));
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body) as List<dynamic>;
      return val.map((e) => MyTicketModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load ticket');
    }
  }

  Future<String> getImageLink(String ticketId) async {
    final response = await http.get(Uri.parse(getAllImages + ticketId));
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body)['data']['imageUrl'] as String;
      return val;
    } else {
      throw Exception('Failed to load ticket');
    }
  }
}
