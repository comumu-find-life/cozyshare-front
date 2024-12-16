import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/DealState.dart';

part 'ProtectedDealResponse.freezed.dart';
part 'ProtectedDealResponse.g.dart';

@freezed
class ProtectedDealResponse with _$ProtectedDealResponse {
  factory ProtectedDealResponse({
    required int id,
    required DealState dealState,
    required double deposit,
    required double fee,
    required double totalPrice,
    required DateTime createAt,
    required DateTime? startAt,
    required DateTime? cancelAt,
    required DateTime? completeAt,
    required DateTime? dealAt,
    required String address,
    required String homeImage,
    required int rent,
    required int bill,
    required int bond,
  }) = _ProtectedDealResponse;

  factory ProtectedDealResponse.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealResponseFromJson(json);
}
