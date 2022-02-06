import 'package:intl/intl.dart';

String getDate(DateTime time) {
  return DateFormat('dd/MM/yyyy').format(time);
}

String getTime(DateTime time) {
  return DateFormat.Hm().format(time);
}
