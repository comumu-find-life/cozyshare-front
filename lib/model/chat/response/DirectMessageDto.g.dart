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
      dealId: (json['dealId'] as num?)?.toInt(),
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
      'dealId': instance.dealId,
      'dealState': _$DealStateEnumMap[instance.dealState],
    };

const _$DealStateEnumMap = {
  DealState.NONE: 'NONE',
  DealState.REQUEST_DEAL: 'REQUEST_DEAL',
  DealState.ACCEPT_DEAL: 'ACCEPT_DEAL',
  DealState.CANCEL_BEFORE_DEAL: 'CANCEL_BEFORE_DEAL',
  DealState.CANCEL_DURING_DEAL: 'CANCEL_DURING_DEAL',
  DealState.COMPLETE_DEAL: 'COMPLETE_DEAL',
};
