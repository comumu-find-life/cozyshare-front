import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageApplicationDto.freezed.dart';
part 'DirectMessageApplicationDto.g.dart';

@freezed
class DirectMessageApplicationDto with _$DirectMessageApplicationDto {
  factory DirectMessageApplicationDto({
    required String message,
    required int receiverId,
    required int roomId,
  }) = _DirectMessageApplicationDto;

  factory DirectMessageApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageApplicationDtoFromJson(json);
}
