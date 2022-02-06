import 'dart:convert';
import 'package:ecdsa/ecdsa.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_marketplace/constants/api_constants.dart';
import 'package:ticket_marketplace/models/each_history_model.dart';
import 'package:ticket_marketplace/models/my_ticket_model.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/models/wrapper_history.dart';
import 'package:ticket_marketplace/utils/user_storage.dart';
import 'package:collection/collection.dart';
import 'package:geocoding/geocoding.dart';

class Pair<T1, T2> {
  final T1 a;
  final T2 b;

  Pair(this.a, this.b);
}

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

  Future<List<WrapperHistory>> getHistoriesFunc(String ticketId) async {
    final response = await http.get(Uri.parse(getHistories + ticketId));
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body) as List<dynamic>;
      return val
          .mapIndexed((i, e) => WrapperHistory(
              action: getActionType(i), eachHistory: EachHistory.fromJson(e)))
          .toList();
    } else {
      throw Exception('Failed to load histories');
    }
  }

  Future<Pair<double, double>> getLocation(String location) async {
    List<Location> locations = await locationFromAddress(location);
    if (locations.isEmpty) {
      return Pair(0.0, 0.0);
    }
    return Pair(locations[0].latitude, locations[0].longitude);
    // final fullUrl = textSearchUrl + location + key;
    // final response = await http.get(Uri.parse(fullUrl));
    // if (response.statusCode == 200) {
    //   try {
    //     final val = jsonDecode(response.body);
    //     print(val);
    //     final location = val['results'][0]['geometry']['location'];
    //     return Pair(location['lat'], location['lng']);
    //   } catch (e) {
    //     return Pair(10.762622, 106.660172);
    //   }
    // }
    // return Pair(10.762622, 106.660172);
  }
}
