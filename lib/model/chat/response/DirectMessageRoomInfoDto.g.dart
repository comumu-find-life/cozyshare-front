// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageRoomInfoDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageRoomInfoDtoImpl _$$DirectMessageRoomInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageRoomInfoDtoImpl(
      id: (json['id'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      senderName: json['senderName'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      receiverName: json['receiverName'] as String,
    );

Map<String, dynamic> _$$DirectMessageRoomInfoDtoImplToJson(
        _$DirectMessageRoomInfoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
    };
