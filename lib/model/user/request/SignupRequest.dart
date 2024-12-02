import 'package:freezed_annotation/freezed_annotation.dart';

part 'SignupRequest.freezed.dart';
part 'SignupRequest.g.dart';

@freezed
class SignupRequest with _$SignupRequest {
  factory SignupRequest({
    required String email,
    required String password,
    required String nickname,
    required String phoneNumber,
    required String gender,
    required String job,
    required String nationality,
    required String signupType,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);


}
