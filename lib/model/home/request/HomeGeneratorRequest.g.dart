// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeGeneratorRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeGeneratorRequestImpl _$$HomeGeneratorRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeGeneratorRequestImpl(
      userIdx: (json['userIdx'] as num).toInt(),
      homeAddress: HomeAddressGeneratorRequest.fromJson(
          json['homeAddress'] as Map<String, dynamic>),
      bathRoomCount: (json['bathRoomCount'] as num).toInt(),
      dealSavable: json['dealSavable'] as bool,
      bedroomCount: (json['bedroomCount'] as num).toInt(),
      bond: (json['bond'] as num).toInt(),
      gender: json['gender'] as String,
      type: json['type'] as String,
      introduce: json['introduce'] as String,
      bill: (json['bill'] as num).toInt(),
      rent: (json['rent'] as num).toInt(),
      options: json['options'] as String,
    );

Map<String, dynamic> _$$HomeGeneratorRequestImplToJson(
        _$HomeGeneratorRequestImpl instance) =>
    <String, dynamic>{
      'userIdx': instance.userIdx,
      'homeAddress': instance.homeAddress,
      'bathRoomCount': instance.bathRoomCount,
      'dealSavable': instance.dealSavable,
      'bedroomCount': instance.bedroomCount,
      'bond': instance.bond,
      'gender': instance.gender,
      'type': instance.type,
      'introduce': instance.introduce,
      'bill': instance.bill,
      'rent': instance.rent,
      'options': instance.options,
    };
