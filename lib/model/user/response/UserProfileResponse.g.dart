// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileResponseImpl _$$UserProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseImpl(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileUrl: json['profileUrl'] as String?,
      job: json['job'] as String,
      gender: json['gender'] as String,
      nationality: json['nationality'] as String,
      introduce: json['introduce'] as String?,
    );

Map<String, dynamic> _$$UserProfileResponseImplToJson(
        _$UserProfileResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'profileUrl': instance.profileUrl,
      'job': instance.job,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'introduce': instance.introduce,
    };
