import 'package:ticket_marketplace/models/ticket_model.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<List<TicketModel>> fetchAllTickets() =>
      appApiProvider.fetchAllTickets();
}
