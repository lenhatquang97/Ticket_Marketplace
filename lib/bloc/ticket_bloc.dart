import 'package:rxdart/rxdart.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';
import 'package:ticket_marketplace/persistence/repository.dart';

class TicketBloc {
  final Repository _repository = Repository();

  final _ticketFetcher = PublishSubject<List<TicketModel>>();

  Stream<List<TicketModel>> get allTickets => _ticketFetcher.stream;

  fetchAllTickets() async {
    List<TicketModel> tickets = await _repository.fetchAllTickets();
    _ticketFetcher.sink.add(tickets);
  }

  dispose() {
    _ticketFetcher.close();
  }
}
