// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProtectedDealResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProtectedDealResponseImpl _$$ProtectedDealResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProtectedDealResponseImpl(
      id: (json['id'] as num).toInt(),
      getterId: (json['getterId'] as num).toInt(),
      providerId: (json['providerId'] as num).toInt(),
      homeId: (json['homeId'] as num).toInt(),
      deposit: (json['deposit'] as num).toDouble(),
      account: json['account'] as String,
      accountHolder: json['accountHolder'] as String,
      bankName: json['bankName'] as String,
      dealState: $enumDecode(_$DealStateEnumMap, json['dealState']),
    );

Map<String, dynamic> _$$ProtectedDealResponseImplToJson(
        _$ProtectedDealResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'getterId': instance.getterId,
      'providerId': instance.providerId,
      'homeId': instance.homeId,
      'deposit': instance.deposit,
      'account': instance.account,
      'accountHolder': instance.accountHolder,
      'bankName': instance.bankName,
      'dealState': _$DealStateEnumMap[instance.dealState]!,
    };

const _$DealStateEnumMap = {
  DealState.NONE: 'NONE',
  DealState.BEFORE_DEPOSIT: 'BEFORE_DEPOSIT',
  DealState.DURING_DEPOSIT: 'DURING_DEPOSIT',
  DealState.DONE_DEPOSIT: 'DONE_DEPOSIT',
  DealState.FINISH: 'FINISH',
  DealState.CANCEL: 'CANCEL',
};
