// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProtectedDealFindRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProtectedDealFindRequestImpl _$$ProtectedDealFindRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ProtectedDealFindRequestImpl(
      getterId: (json['getterId'] as num).toInt(),
      providerId: (json['providerId'] as num).toInt(),
      homeId: (json['homeId'] as num).toInt(),
      dmId: (json['dmId'] as num).toInt(),
    );

Map<String, dynamic> _$$ProtectedDealFindRequestImplToJson(
        _$ProtectedDealFindRequestImpl instance) =>
    <String, dynamic>{
      'getterId': instance.getterId,
      'providerId': instance.providerId,
      'homeId': instance.homeId,
      'dmId': instance.dmId,
    };
