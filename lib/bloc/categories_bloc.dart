import 'package:rxdart/rxdart.dart';
import 'package:ticket_marketplace/persistence/repository.dart';

class CategoriesBloc {
  final Repository _repository = Repository();

  final _categoriesRead = PublishSubject<List<dynamic>>();

  Stream<List<dynamic>> get categories => _categoriesRead.stream;

  readCategoriesJson() async {
    List<dynamic> categories = await _repository.readCategoriesJson();
    _categoriesRead.sink.add(categories);
  }

  dispose() {
    _categoriesRead.close();
  }
}
