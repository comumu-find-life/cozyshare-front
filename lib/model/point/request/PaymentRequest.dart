import 'package:freezed_annotation/freezed_annotation.dart';

part 'PaymentRequest.freezed.dart';
part 'PaymentRequest.g.dart';

@freezed
class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required String paymentId,
    required String payerId,
    required String token,
    required double amount,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}
