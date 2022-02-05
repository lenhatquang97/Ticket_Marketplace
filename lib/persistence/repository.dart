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
}
