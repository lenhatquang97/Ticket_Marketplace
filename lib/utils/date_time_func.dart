String getDate(DateTime time) {
  return time.day.toString() +
      "/" +
      time.month.toString() +
      "/" +
      time.year.toString();
}

String getTime(DateTime time) {
  return time.hour.toString() + ":" + time.minute.toString();
}
