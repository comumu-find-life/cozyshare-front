import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_and_job/model/deal/enums/DealState.dart';

part 'DirectMessageDto.freezed.dart';
part 'DirectMessageDto.g.dart';

@freezed
class DirectMessageResponse with _$DirectMessageResponse {
  factory DirectMessageResponse({
    required int senderId,
    required int receiverId,
    required String message,
    required String? sentAt,
    required int isDeal,
    required int? dealId,
    required DealState? dealState
  }) = _DirectMessageDto;

  factory DirectMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectMessageResponseFromJson(json);
}

extension DirectMessageResponseExtension on DirectMessageResponse {
  String formatDate() {
    if (sentAt == null) return '';
    final dateTime = DateTime.parse(sentAt!);
    return '${dateTime.year} . ${dateTime.month} / ${dateTime.day}';
  }

  String formatTime() {
    if (sentAt == null) return '';
    final dateTime = DateTime.parse(sentAt!);
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = hour >= 12 ? 'pm' : 'am';
    final formattedHour = hour > 12 ? hour - 12 : hour;
    final formattedMinute = minute.toString().padLeft(2, '0');
    return '$period $formattedHour.$formattedMinute';
  }
}
