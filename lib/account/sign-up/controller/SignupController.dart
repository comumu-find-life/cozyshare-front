import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:home_and_job/account/login/view/MainLoginView.dart';
import 'package:home_and_job/rest-api/user-api/SignupApi.dart';
import 'package:home_and_job/model/user/enums/SignupType.dart';
import 'package:home_and_job/model/user/request/SignupRequest.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../view/SuccessSignupView.dart';

class SignupController extends GetxController {
  Rx<int> _step = 1.obs;
  Rx<bool> _canInputCode = false.obs;

  // 각각 뷰에서 버튼 클릭 여부를 판별할 변숭
  Rx<bool> _checkEmail = false.obs;
  Rx<bool> _checkPrivacy = false.obs;
  Rx<bool> _checkDetail = false.obs;

  String _selectGender = "";
  String _selectCountry = "";
  String _profileUrl = "";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _emailCheckController = TextEditingController();

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwCheckController = TextEditingController();
  TextEditingController _jobController = TextEditingController();

  // 이메일 검증화면 버튼
  void ontapEmailButton() {
    _step.value = 2;
  }

  // 이름, 비번 검증화면 버튼
  void ontapPrivacyButton() {
    _step.value = 3;
  }

  void ontapDetailButton() async {
    var signupRequest = SignupRequest(
        email: _emailController.text,
        password: _pwController.text,
        nickname: _nameController.text,
        phoneNumber: "01012341234",
        gender: 'MALE',
        role: 'PROVIDER',
        job: _jobController.text,
        nationality: _selectCountry,
        signupType: SignupType.EMAIL.name);

    bool response = await SignupApi()
        .signupApi(signupRequest, _profileUrl == "" ? null : _profileUrl);

    if (response) {
      Get.to(() => SuccessSignupView());
    } else {}
  }

  // 이메일 검증 메서드
  void checkEmailCode() {
    _checkEmail.value = true;
  }

  // 이메일 인증코드 요청 메서드
  void sendEmail() {
    _canInputCode.value = true;
  }

  // 비밀번호 길이 8 자리 이상
  void validatePrivacy() {
    if (_nameController.text.length >= 1 &&
        _pwCheckController.text.length >= 7 &&
        (_pwCheckController.text == _pwCheckController.text)) {
      _checkPrivacy.value = true;
    } else {
      _checkPrivacy.value = false;
    }
  }

  void validateUserDetail() {
    if (_selectGender != "" &&
        _selectCountry != "" &&
        _jobController.text != "") {
      _checkDetail.value = true;
    } else {
      _checkDetail.value = false;
    }
  }

  void selectImage(String path) {
    _profileUrl = path;
  }

  void selectGender(String value) {
    _selectGender = value;
  }

  void selectCountry(String value) {
    _selectCountry = value;
  }

  void selectProfileImage() {}

  bool get canInputCode => _canInputCode.value;

  int get step => _step.value;

  bool get checkDetail => _checkDetail.value;

  bool get checkPrivacy => _checkPrivacy.value;

  bool get checkEmail => _checkEmail.value;

  TextEditingController get nameController => _nameController;

  TextEditingController get idController => _idController;

  TextEditingController get pwController => _pwController;

  TextEditingController get pwCheckController => _pwCheckController;

  TextEditingController get emailController => _emailController;

  TextEditingController get emailCheckController => _emailCheckController;

  TextEditingController get jobController => _jobController;
}
