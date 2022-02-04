// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      txid: json['txid'] as String,
      ticketId: json['ticketId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      category: json['category'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'ticketId': instance.ticketId,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'category': instance.category,
      'start': instance.start,
      'end': instance.end,
      'price': instance.price,
    };
