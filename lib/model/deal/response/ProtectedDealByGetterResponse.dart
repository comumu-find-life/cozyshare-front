import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/DealState.dart';

part 'ProtectedDealByGetterResponse.freezed.dart';
part 'ProtectedDealByGetterResponse.g.dart';

@freezed
class ProtectedDealByGetterResponse with _$ProtectedDealByGetterResponse {
  factory ProtectedDealByGetterResponse({
    required int id,
    required DealState dealState,
    required double deposit,
    required double fee,
    required double totalPrice,
    required DateTime dealStartDateTime,
    required DateTime? depositRequestDateTime,
    required DateTime? depositCompletionDateTime,
    required DateTime? dealCompletionRequestDateTime,
    required DateTime? dealCompletionDateTime,
    required DateTime? dealCancellationDateTime,
    required String address,
    required String homeImage,
    required double rent,
    required double bill,
    required double bond,
    required String randomDepositorName,
  }) = _ProtectedDealByGetterResponse;

  factory ProtectedDealByGetterResponse.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealByGetterResponseFromJson(json);
}
