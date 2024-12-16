import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import 'package:home_and_job/rest-api/user-api/ProfileDetailApi.dart';
import 'package:home_and_job/rest-api/user-api/ProfileEditApi.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../model/user/request/UserProfileUpdateRequest.dart';
import '../../../model/user/response/UserProfileResponse.dart';

class EditProfileController extends GetxController {
  UserProfileResponse? _userProfileResponse;
  TextEditingController jobController = TextEditingController();
  TextEditingController introduceController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  String? _updateImageUrl;
  String? _userProfileUrl;
  String? _selectGender;

  // 로딩 상태를 관리하는 변수
  var isLoading = false.obs;

  Future<bool> setInit(UserProfileResponse userProfileResponse) async {
    _userProfileResponse = userProfileResponse;
    _userProfileUrl = userProfileResponse.profileUrl;
    jobController = TextEditingController(text: userProfileResponse.job);
    introduceController =
        TextEditingController(text: userProfileResponse.introduce);
    nicknameController =
        TextEditingController(text: userProfileResponse.nickname);
    return true;
  }

  void selectImage(String path) {
    _updateImageUrl = path;
  }

  void edit(BuildContext context) async {
    // 로딩 상태 시작
    isLoading.value = true;

    var updateDto = createUserProfileUpdateRequest();

    if(updateDto.isValid()){
      if (_updateImageUrl != null) {
        await ProfileEditApi()
            .editProfileImage(_userProfileResponse!.id, _updateImageUrl!);
      }
      //사용자 상세 정보 수정
      var bool = await ProfileEditApi().editProfileInformation(updateDto);

      if (bool) {
        Get.to(() => FinishView(
            "Profile information \nhas been updated.", "Please touch the screen."));
      }

      // 로딩 상태 종료

    }else{
      CustomSnackBar().show(context, "Please make the nickname at least 5 characters long.");
    }


    isLoading.value = false;
  }

  void validateInformation(){

  }

  UserProfileUpdateRequest createUserProfileUpdateRequest() {
    return UserProfileUpdateRequest(
        userId: _userProfileResponse!.id,
        nickname: nicknameController.text,
        job: jobController.text,
        gender: _userProfileResponse!.gender,
        introduce: introduceController.text);
  }

  void selectGender(String value) {
    _selectGender = value;
  }

  String? get userProfileUrl => _userProfileUrl;

  String? get updateImageUrl => _updateImageUrl;

  UserProfileResponse? get userProfileResponse => _userProfileResponse;
}
