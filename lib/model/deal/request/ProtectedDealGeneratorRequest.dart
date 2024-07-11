
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProtectedDealGeneratorRequest.freezed.dart';
part 'ProtectedDealGeneratorRequest.g.dart';

@freezed
class ProtectedDealGeneratorRequest with _$ProtectedDealGeneratorRequest {
  factory ProtectedDealGeneratorRequest({
    required int getterId,
    required int providerId,
    required int homeId,
    required int dmId,
    required int deposit,
    required String accountHolder,
    required String account,
    required String bankName,

  }) = _ProtectedDealGeneratorRequest;

  factory ProtectedDealGeneratorRequest.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealGeneratorRequestFromJson(json);
}
