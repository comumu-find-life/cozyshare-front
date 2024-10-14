import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProtectedDealGeneratorResponse.freezed.dart';
part 'ProtectedDealGeneratorResponse.g.dart';

@freezed
class ProtectedDealGeneratorResponse with _$ProtectedDealGeneratorResponse {
  factory ProtectedDealGeneratorResponse({
    required String secretKey,
    required int dealId,
  }) = _ProtectedDealGeneratorResponse;

  factory ProtectedDealGeneratorResponse.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealGeneratorResponseFromJson(json);
}