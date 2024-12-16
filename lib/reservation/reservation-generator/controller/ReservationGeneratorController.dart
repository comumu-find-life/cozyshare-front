import 'package:get/get.dart';

class ReservationGeneratorController extends GetxController {
  var selectedDateTime = Rx<DateTime?>(null);

  void setSelectedDateTime(DateTime dateTime) {
    selectedDateTime.value = dateTime;
  }
}