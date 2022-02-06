// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'each_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EachHistory _$EachHistoryFromJson(Map<String, dynamic> json) => EachHistory(
      timestamp: json['timestamp'] as String,
      data: EachHistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EachHistoryToJson(EachHistory instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'data': instance.data.toJson(),
    };

EachHistoryData _$EachHistoryDataFromJson(Map<String, dynamic> json) =>
    EachHistoryData(
      address: json['address'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$EachHistoryDataToJson(EachHistoryData instance) =>
    <String, dynamic>{
      'address': instance.address,
      'time': instance.time,
    };
