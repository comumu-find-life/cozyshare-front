import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageRoomListDto.freezed.dart';
part 'DirectMessageRoomListDto.g.dart';

@freezed
class DirectMessageRoomListDto with _$DirectMessageRoomListDto {
  factory DirectMessageRoomListDto({
    required int id,
    required int userId,
    required String userNickname,
    required String? userProfileUrl,
    required int progressHomeId,
    required String lastMessage,
  }) = _DirectMessageRoomListDto;

  factory DirectMessageRoomListDto.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageRoomListDtoFromJson(json);
}