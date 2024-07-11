// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProtectedDealGeneratorRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProtectedDealGeneratorRequestImpl
    _$$ProtectedDealGeneratorRequestImplFromJson(Map<String, dynamic> json) =>
        _$ProtectedDealGeneratorRequestImpl(
          getterId: (json['getterId'] as num).toInt(),
          providerId: (json['providerId'] as num).toInt(),
          homeId: (json['homeId'] as num).toInt(),
          dmId: (json['dmId'] as num).toInt(),
          deposit: (json['deposit'] as num).toInt(),
          accountHolder: json['accountHolder'] as String,
          account: json['account'] as String,
          bankName: json['bankName'] as String,
        );

Map<String, dynamic> _$$ProtectedDealGeneratorRequestImplToJson(
        _$ProtectedDealGeneratorRequestImpl instance) =>
    <String, dynamic>{
      'getterId': instance.getterId,
      'providerId': instance.providerId,
      'homeId': instance.homeId,
      'dmId': instance.dmId,
      'deposit': instance.deposit,
      'accountHolder': instance.accountHolder,
      'account': instance.account,
      'bankName': instance.bankName,
    };
