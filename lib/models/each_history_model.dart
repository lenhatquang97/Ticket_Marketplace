import 'package:json_annotation/json_annotation.dart';
part 'each_history_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EachHistory {
  final String timestamp;
  final EachHistoryData data;
  const EachHistory({required this.timestamp, required this.data});
  factory EachHistory.fromJson(Map<String, dynamic> json) =>
      _$EachHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$EachHistoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EachHistoryData {
  final String address;
  final String time;
  const EachHistoryData({required this.address, required this.time});
  factory EachHistoryData.fromJson(Map<String, dynamic> json) =>
      _$EachHistoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$EachHistoryDataToJson(this);
}
