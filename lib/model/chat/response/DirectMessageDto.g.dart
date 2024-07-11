// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DirectMessageDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectMessageDtoImpl _$$DirectMessageDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectMessageDtoImpl(
      senderId: (json['senderId'] as num).toInt(),
      receiverId: (json['receiverId'] as num).toInt(),
      message: json['message'] as String,
      sentAt: json['sentAt'] as String?,
      isDeal: (json['isDeal'] as num).toInt(),
      dealState: $enumDecodeNullable(_$DealStateEnumMap, json['dealState']),
    );


Map<String, dynamic> _$$DirectMessageDtoImplToJson(
        _$DirectMessageDtoImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'sentAt': instance.sentAt,
      'isDeal': instance.isDeal,
      'dealState': _$DealStateEnumMap[instance.dealState],
    };

const _$DealStateEnumMap = {
  DealState.NONE: 'NONE',
  DealState.BEFORE_DEPOSIT: 'BEFORE_DEPOSIT',
  DealState.DURING_DEPOSIT: 'DURING_DEPOSIT',
  DealState.DONE_DEPOSIT: 'DONE_DEPOSIT',
  DealState.FINISH: 'FINISH',
  DealState.CANCEL: 'CANCEL',
};
