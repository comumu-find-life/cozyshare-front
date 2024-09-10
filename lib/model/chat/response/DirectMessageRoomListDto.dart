import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'DirectMessageRoomListDto.freezed.dart';
part 'DirectMessageRoomListDto.g.dart';

@freezed
class DirectMessageRoomListResponse with _$DirectMessageRoomListResponse {
  factory DirectMessageRoomListResponse({
    required int id,
    required int otherUserId,
    required String userNickname,
    required String? userProfileUrl,
    required int progressHomeId,
    required String lastMessage,
    required DateTime lastSendDateTime,
  }) = _DirectMessageRoomListDto;

  factory DirectMessageRoomListResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageRoomListResponseFromJson(json);

}