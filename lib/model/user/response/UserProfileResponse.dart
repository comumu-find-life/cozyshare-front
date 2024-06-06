import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/Gender.dart';


part 'UserProfileResponse.freezed.dart';
part 'UserProfileResponse.g.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    required int id,
    required String nickname,
    required String? profileUrl,
    required String job,
    required String gender,
    required String nationality,
    required String? introduce,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}