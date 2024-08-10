import 'package:intl/intl.dart';

class ConverterUtil{
  String? formatKoreanDateTime(DateTime? dateTime) {
    if(dateTime == null){
      return null;
    }
    final DateFormat formatter = DateFormat('yyyy년 M월 d일 HH:mm');
    return formatter.format(dateTime!);
  }

  String? formatEnglishDateTime(DateTime? dateTime) {
    if(dateTime == null){
      return null;
    }
    final DateFormat formatter = DateFormat('yyyy M month d day HH:mm');
    return formatter.format(dateTime);
  }
}