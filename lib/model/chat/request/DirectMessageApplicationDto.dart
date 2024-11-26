import 'package:freezed_annotation/freezed_annotation.dart';

part 'DirectMessageApplicationDto.freezed.dart';
part 'DirectMessageApplicationDto.g.dart';

@freezed
class DirectMessageApplicationRequest with _$DirectMessageApplicationRequest{
  factory DirectMessageApplicationRequest({
    required String message,
    required int receiverId,
    required int roomId,
    required int senderId,
  }) = _DirectMessageApplicationDto;

  factory DirectMessageApplicationRequest.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageApplicationRequestFromJson(json);
}
