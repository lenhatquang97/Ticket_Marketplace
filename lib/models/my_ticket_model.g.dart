// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTicketModel _$MyTicketModelFromJson(Map<String, dynamic> json) =>
    MyTicketModel(
      txid: json['txid'] as String,
      address: json['address'] as String,
      data: MyTicketData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyTicketModelToJson(MyTicketModel instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'address': instance.address,
      'data': instance.data.toJson(),
    };

MyTicketData _$MyTicketDataFromJson(Map<String, dynamic> json) => MyTicketData(
      ticketId: json['ticketId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      category: json['category'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$MyTicketDataToJson(MyTicketData instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'category': instance.category,
      'start': instance.start,
      'end': instance.end,
    };
