// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageRoomListDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageRoomListDtoImpl _$$DirectMessageRoomListDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageRoomListDtoImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userNickname: json['userNickname'] as String,
      userProfileUrl: json['userProfileUrl'] as String?,
      progressHomeId: (json['progressHomeId'] as num).toInt(),
      lastMessage: json['lastMessage'] as String,
    );

Map<String, dynamic> _$$DirectMessageRoomListDtoImplToJson(
        _$DirectMessageRoomListDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userNickname': instance.userNickname,
      'userProfileUrl': instance.userProfileUrl,
      'progressHomeId': instance.progressHomeId,
      'lastMessage': instance.lastMessage,
    };
