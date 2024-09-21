// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageRequestImpl _$$DirectMessageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageRequestImpl(
      senderId: (json['senderId'] as num).toInt(),
      roomId: json['roomId'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      message: json['message'] as String,
      isDeal: (json['isDeal'] as num).toInt(),
      dealId: (json['dealId'] as num?)?.toInt(),
      dealState: json['dealState'] as String?,
    );

Map<String, dynamic> _$$DirectMessageRequestImplToJson(
        _$DirectMessageRequestImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'roomId': instance.roomId,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'isDeal': instance.isDeal,
      'dealId': instance.dealId,
      'dealState': instance.dealState,
    };
