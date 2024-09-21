import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/DealState.dart';

part 'ProtectedDealByProviderResponse.freezed.dart';
part 'ProtectedDealByProviderResponse.g.dart';

@freezed
class ProtectedDealByProviderResponse with _$ProtectedDealByProviderResponse {
  factory ProtectedDealByProviderResponse({
    required String account,
    required String accountHolder,
    required String bankName,
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
  }) = _ProtectedDealByProviderResponse;

  factory ProtectedDealByProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealByProviderResponseFromJson(json);
}
