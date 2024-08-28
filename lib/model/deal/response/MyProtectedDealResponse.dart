import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/DealState.dart';

part 'MyProtectedDealResponse.freezed.dart';
part 'MyProtectedDealResponse.g.dart';

@freezed
class MyProtectedDealResponse with _$MyProtectedDealResponse {
  factory MyProtectedDealResponse({
    required int id,
    required DealState dealState,
    required double deposit,
    required double fee,
    required double totalPrice,
    required DateTime dealStartDateTime,
    DateTime? depositRequestDateTime,
    DateTime? depositCompletionDateTime,
    DateTime? dealCompletionRequestDateTime,
    DateTime? dealCompletionDateTime,
    DateTime? dealCancellationDateTime,
    required String address,
    required String homeImage,
    required double rent,
    required double bill,
    double? bond,
    String? randomDepositorName,
  }) = _MyProtectedDealResponse;

  factory MyProtectedDealResponse.fromJson(Map<String, dynamic> json) =>
      _$MyProtectedDealResponseFromJson(json);
}