// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageApplicationDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageApplicationDtoImpl _$$DirectMessageApplicationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageApplicationDtoImpl(
      message: json['message'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      roomId: (json['roomId'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
    );

Map<String, dynamic> _$$DirectMessageApplicationDtoImplToJson(
        _$DirectMessageApplicationDtoImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'receiverId': instance.receiverId,
      'roomId': instance.roomId,
      'senderId': instance.senderId,
    };
