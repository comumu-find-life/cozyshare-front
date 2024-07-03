import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageDto.freezed.dart';
part 'DirectMessageDto.g.dart';

@freezed
class DirectMessageDto with _$DirectMessageDto {
  factory DirectMessageDto({
    required int senderId,
    required String senderName,
    required String roomId,
    required int receiverId,
    required String message,
  }) = _DirectMessageDto;

  factory DirectMessageDto.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageDtoFromJson(json);
}
