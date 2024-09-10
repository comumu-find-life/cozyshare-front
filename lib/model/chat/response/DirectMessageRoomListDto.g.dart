// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageRoomListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageRoomListDtoImpl _$$DirectMessageRoomListDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageRoomListDtoImpl(
      id: (json['id'] as num).toInt(),
      otherUserId: (json['otherUserId'] as num).toInt(),
      userNickname: json['userNickname'] as String,
      userProfileUrl: json['userProfileUrl'] as String?,
      progressHomeId: (json['progressHomeId'] as num).toInt(),
      lastMessage: json['lastMessage'] as String,
      lastSendDateTime: DateTime.parse(json['lastSendDateTime'] as String),
    );

Map<String, dynamic> _$$DirectMessageRoomListDtoImplToJson(
        _$DirectMessageRoomListDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'otherUserId': instance.otherUserId,
      'userNickname': instance.userNickname,
      'userProfileUrl': instance.userProfileUrl,
      'progressHomeId': instance.progressHomeId,
      'lastMessage': instance.lastMessage,
      'lastSendDateTime': instance.lastSendDateTime.toIso8601String(),
    };
