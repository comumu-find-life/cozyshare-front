import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../../constants/Fonts.dart';
import '../../../model/user/response/UserProfileResponse.dart';
import '../controller/EditProfileController.dart';
import '../widgets/EditProfileImageWidget.dart';
import '../widgets/EditProfileInformationWidget.dart';

class EditProfileView extends StatefulWidget {
  UserProfileResponse _userProfileResponse;

  EditProfileView(this._userProfileResponse);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    EditProfileController _controller = EditProfileController();

    return Scaffold(
        backgroundColor: kWhiteBackGroundColor,
        bottomSheet: ProfileEditBottomWidget(_controller, context),
        appBar: CommonAppBar(
          canBack: true,
          title: 'Edit Profile',
          color: kWhiteBackGroundColor,
        ),
        body: FutureBuilder(
            future: _controller.setInit(widget._userProfileResponse),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: Body2Text("Network Error", kTextBlackColor),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditProfileImageWidget(_controller),
                      EditProfileInformationWidget(_controller),
                    ],
                  ),
                );
              }
            }));
  }
}

Widget ProfileEditBottomWidget(
    EditProfileController _controller, BuildContext context) {
  return Obx(() => Container(
        width: double.infinity,
        color: kBlueColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlueColor,
            side: BorderSide.none, // 테두리 없애기
            shadowColor: Colors.transparent, // 그림자 없애기
          ),
          // 로딩 중이면 버튼을 비활성화하고 로딩 표시
          onPressed: _controller.isLoading.value
              ? null
              : () async {
                  _controller.edit(context);
                },
          child: _controller.isLoading.value
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(kWhiteBackGroundColor),
                )
              : FRegularText("Edit", kWhiteBackGroundColor, 16),
        ),
      ));
}
