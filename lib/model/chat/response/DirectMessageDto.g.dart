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
  DealState.BEFORE_DEPOSIT: 'BEFORE_DEPOSIT',
  DealState.REQUEST_DEPOSIT: 'REQUEST_DEPOSIT',
  DealState.COMPLETE_DEPOSIT: 'COMPLETE_DEPOSIT',
  DealState.CANCEL_DEPOSIT: 'CANCEL_DEPOSIT',
  DealState.REQUEST_COMPLETE_DEAL: 'REQUEST_COMPLETE_DEAL',
  DealState.COMPLETE_DEAL: 'COMPLETE_DEAL',
  DealState.CANCEL_DEAL: 'CANCEL_DEAL',
};
