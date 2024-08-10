import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../detail-profile/view/ProfileDetailView.dart';
import '../../../protected-deal/deal-generator/view/DealGeneratorViewByProvider.dart';
import '../../chat-detail-provider/controller/ChatProviderDetailController.dart';

AppBar ChatAppBar(BuildContext context, String receiverName, int receiverId) {
  return AppBar(
    backgroundColor: kGrey100Color,
    toolbarHeight: 55.h,
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kTextBlackColor,
                    size: 18.sp,
                  )),
            ),
            Container(
              child: Title3Text("${receiverName}", kTextBlackColor),
            ),
            InkWell(
              onTap: () {
                Get.to(() => ProfileDetailView(receiverId));
              },
              child: Container(
                width: 35.w,
                height: 35.h,
                child: CircleAvatar(
                  backgroundColor: kGrey200Color,
                  backgroundImage:
                  AssetImage("assets/images/test/man.png"),
                ),
              ),
            ),

          ],
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    elevation: 0,
  );
}