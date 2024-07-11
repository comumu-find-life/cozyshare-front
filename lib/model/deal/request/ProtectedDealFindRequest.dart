import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProtectedDealFindRequest.freezed.dart';
part 'ProtectedDealFindRequest.g.dart';

@freezed
class ProtectedDealFindRequest with _$ProtectedDealFindRequest {
  factory ProtectedDealFindRequest({
    required int getterId,
    required int providerId,
    required int homeId,
    required int dmId,
  }) = _ProtectedDealFindRequest;

  factory ProtectedDealFindRequest.fromJson(Map<String, dynamic> json) =>
      _$ProtectedDealFindRequestFromJson(json);
}
