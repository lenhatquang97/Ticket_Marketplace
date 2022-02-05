import 'package:ecdsa/ecdsa.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
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
  Future<List<TicketModel>> fetchOwnTickets() =>
      appApiProvider.fetchOwnTickets();
}
