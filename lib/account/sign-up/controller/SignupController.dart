
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwCheckController = TextEditingController();

  TextEditingController get nameController => _nameController;

  TextEditingController get idController => _idController;

  TextEditingController get pwController => _pwController;

  TextEditingController get pwCheckController => _pwCheckController;
}