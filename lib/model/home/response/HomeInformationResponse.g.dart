// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeInformationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeInformationResponseImpl _$$HomeInformationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeInformationResponseImpl(
      providerId: json['providerId'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      options: json['options'] as String?,
      bond: (json['bond'] as num?)?.toInt(),
      residentCount: (json['residentCount'] as num?)?.toInt(),
      homeId: (json['homeId'] as num?)?.toInt(),
      providerProfileUrl: json['providerProfileUrl'] as String?,
      providerName: json['providerName'] as String?,
      address: json['address'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bill: (json['bill'] as num?)?.toInt(),
      rent: (json['rent'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$HomeTypeEnumMap, json['type']),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      introduce: json['introduce'] as String?,
      bathRoomCount: (json['bathRoomCount'] as num?)?.toInt(),
      bedroomCount: (json['bedroomCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HomeInformationResponseImplToJson(
        _$HomeInformationResponseImpl instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'options': instance.options,
      'bond': instance.bond,
      'residentCount': instance.residentCount,
      'homeId': instance.homeId,
      'providerProfileUrl': instance.providerProfileUrl,
      'providerName': instance.providerName,
      'address': instance.address,
      'images': instance.images,
      'bill': instance.bill,
      'rent': instance.rent,
      'type': _$HomeTypeEnumMap[instance.type],
      'gender': _$GenderEnumMap[instance.gender],
      'introduce': instance.introduce,
      'bathRoomCount': instance.bathRoomCount,
      'bedroomCount': instance.bedroomCount,
    };

const _$HomeTypeEnumMap = {
  HomeType.WHOLE_PROPERTY_RENT: 'WHOLE_PROPERTY_RENT',
  HomeType.SHARED_ROOM: 'SHARED_ROOM',
  HomeType.PRIVATE_ROOM: 'PRIVATE_ROOM',
  HomeType.HOME_STAY: 'HOME_STAY',
  HomeType.STUDIO: 'STUDIO',
  HomeType.STUDENT_ACCOMMODATION: 'STUDENT_ACCOMMODATION',
  HomeType.ONE_BED_FLAT: 'ONE_BED_FLAT',
  HomeType.NONE: 'NONE',
};

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.ANYTHING: 'ANYTHING',
};
