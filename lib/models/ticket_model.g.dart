// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      txid: json['txid'] as String,
      address: json['address'] as String,
      data: TicketData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'address': instance.address,
      'data': instance.data.toJson(),
    };

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
      ticketId: json['ticketId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      category: json['category'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$TicketDataToJson(TicketData instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'category': instance.category,
      'start': instance.start,
      'end': instance.end,
    };
