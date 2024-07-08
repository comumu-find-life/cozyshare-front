import 'package:freezed_annotation/freezed_annotation.dart';

import '../../deal/enums/DealState.dart';

part 'DirectMessageRequest.freezed.dart';
part 'DirectMessageRequest.g.dart';

@freezed
class DirectMessageRequest with _$DirectMessageRequest {
  factory DirectMessageRequest({
    required int senderId,
    required String roomId,
    required int receiverId,
    required String message,
    required bool isDeal,
    required String? dealState
  }) = _DirectMessageRequest;

  factory DirectMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageRequestFromJson(json);
}
