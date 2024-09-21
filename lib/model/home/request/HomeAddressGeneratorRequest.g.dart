// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeAddressGeneratorRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeAddressGeneratorRequestImpl _$$HomeAddressGeneratorRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeAddressGeneratorRequestImpl(
      state: json['state'] as String,
      city: json['city'] as String,
      postCode: (json['postCode'] as num).toInt(),
      detailAddress: json['detailAddress'] as String,
      streetName: json['streetName'] as String,
      streetCode: json['streetCode'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$HomeAddressGeneratorRequestImplToJson(
        _$HomeAddressGeneratorRequestImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'city': instance.city,
      'postCode': instance.postCode,
      'detailAddress': instance.detailAddress,
      'streetName': instance.streetName,
      'streetCode': instance.streetCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
