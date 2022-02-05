import 'package:rxdart/rxdart.dart';
import 'package:ticket_marketplace/models/my_ticket_model.dart';
import 'package:ticket_marketplace/persistence/repository.dart';

class MyTicketBloc {
  final Repository _repository = Repository();
  final _ticketFetcher = PublishSubject<List<MyTicketModel>>();

  Stream<List<MyTicketModel>> get ownTickets => _ticketFetcher.stream;

  fetchOwnTickets() async {
    List<MyTicketModel> tickets = await _repository.fetchOwnTickets();
    _ticketFetcher.sink.add(tickets);
  }

  dispose() {
    _ticketFetcher.close();
  }
}
