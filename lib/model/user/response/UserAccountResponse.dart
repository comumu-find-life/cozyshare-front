import 'package:freezed_annotation/freezed_annotation.dart';
import 'PointChargeHistoryResponse.dart';

part 'UserAccountResponse.freezed.dart';
part 'UserAccountResponse.g.dart';

@freezed
class UserAccountResponse with _$UserAccountResponse {
  const factory UserAccountResponse({
    required String bsb,
    required String accountNumber,
    required double point,
    required List<PointChargeHistoryResponse> chargeHistories,
  }) = _UserAccountResponse;

  factory UserAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAccountResponseFromJson(json);

}

// 확장 메서드로 checkEnoughPoint 추가
extension UserAccountResponseX on UserAccountResponse {
  bool checkEnoughPoint(double point) {
    return this.point >= point;
  }
}