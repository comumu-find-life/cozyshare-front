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
          dealAt: DateTime.parse(json['dealAt'] as String),
        );

Map<String, dynamic> _$$ProtectedDealGeneratorRequestImplToJson(
        _$ProtectedDealGeneratorRequestImpl instance) =>
    <String, dynamic>{
      'getterId': instance.getterId,
      'providerId': instance.providerId,
      'homeId': instance.homeId,
      'dmId': instance.dmId,
      'deposit': instance.deposit,
      'dealAt': instance.dealAt.toIso8601String(),
    };
