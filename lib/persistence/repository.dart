import 'package:ecdsa/ecdsa.dart';
import 'package:ticket_marketplace/models/my_ticket_model.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/models/wrapper_history.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<List<TicketModel>> fetchAllTickets() =>
      appApiProvider.fetchAllTickets();

  Future<List<dynamic>> readCategoriesJson() =>
      appApiProvider.readCategoriesJson();

  Future<int> buyfromStore(String ticketId, String address) =>
      appApiProvider.buyfromStore(ticketId, address);

  Future<int> createTransactionFunc(
          String txOutId, String receiverPublicId, Signature signaturer) =>
      appApiProvider.createTransactionFunc(
          txOutId, receiverPublicId, signaturer);
  Future<List<MyTicketModel>> fetchOwnTickets() =>
      appApiProvider.fetchOwnTickets();
  Future<String> getImageLink(String ticketId) =>
      appApiProvider.getImageLink(ticketId);
  Future<List<WrapperHistory>> getHistoriesFunc(String ticketId) =>
      appApiProvider.getHistoriesFunc(ticketId);
  Future<Pair<double, double>> getLocation(String location) =>
      appApiProvider.getLocation(location);
}
