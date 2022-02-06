import 'package:rxdart/rxdart.dart';
import 'package:ticket_marketplace/models/wrapper_history.dart';
import 'package:ticket_marketplace/persistence/repository.dart';

class HistoryBloc {
  final Repository _repository = Repository();
  final _historyFetcher = PublishSubject<List<WrapperHistory>>();

  Stream<List<WrapperHistory>> get historyStream => _historyFetcher.stream;

  getHistoriesFunc(String ticketId) async {
    List<WrapperHistory> histories =
        await _repository.getHistoriesFunc(ticketId);
    _historyFetcher.sink.add(histories);
  }

  dispose() {
    _historyFetcher.close();
  }
}
