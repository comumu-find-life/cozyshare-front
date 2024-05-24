

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChattingController extends GetxController {
  TextEditingController _filterController = TextEditingController();

  TextEditingController get filterController => _filterController;
}