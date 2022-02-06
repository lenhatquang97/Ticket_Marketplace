import 'package:ticket_marketplace/models/each_history_model.dart';

class WrapperHistory {
  final String action;
  final EachHistory eachHistory;
  const WrapperHistory({required this.action, required this.eachHistory});
}

String getActionType(int index) {
  if (index == 0) {
    return "Create";
  }
  return "Send";
}
