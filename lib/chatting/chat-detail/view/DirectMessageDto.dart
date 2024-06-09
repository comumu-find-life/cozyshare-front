import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageDto.freezed.dart';
part 'DirectMessageDto.g.dart';

@freezed
class DirectMessageDto with _$DirectMessageDto {
  factory DirectMessageDto({
    required int senderId,
    required int receiverId,
    required String message,
    required int roomId,
  }) = _DirectMessageDto;

  factory DirectMessageDto.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageDtoFromJson(json);
}
