
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserProfileUpdateRequest.freezed.dart';
part 'UserProfileUpdateRequest.g.dart';

@freezed
class UserProfileUpdateRequest with _$UserProfileUpdateRequest {
  factory UserProfileUpdateRequest({
    required int userId,
    required String nickname,
    required String job,
    required String gender,
    required String introduce,
  }) = _UserProfileUpdateRequest;

  factory UserProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserProfileUpdateRequestFromJson(json);
}

// 확장 메서드로 isValid 추가
extension UserProfileUpdateRequestValidation on UserProfileUpdateRequest {
  bool isValid() {
    return nickname.length >= 6 && job.length >= 5;
  }
}
