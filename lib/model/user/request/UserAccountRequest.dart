import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserAccountRequest.freezed.dart';
part 'UserAccountRequest.g.dart';

@freezed
class UserAccountRequest with _$UserAccountRequest {
  const factory UserAccountRequest({
    required String depositorName,
    required String bsb,
    required String accountNumber,
  }) = _UserAccountRequest;

  factory UserAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UserAccountRequestFromJson(json);
}
