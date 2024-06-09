
import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageRoomInfoDto.freezed.dart';
part 'DirectMessageRoomInfoDto.g.dart';

@freezed
class DirectMessageRoomInfoDto with _$DirectMessageRoomInfoDto {
  factory DirectMessageRoomInfoDto({
    required int id,
    required int senderId,
    required String senderName,
    required int receiverId,
    required String receiverName,
  }) = _DirectMessageRoomInfoDto;

  factory DirectMessageRoomInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageRoomInfoDtoFromJson(json);
}
