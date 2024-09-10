import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail-getter/view/ChatGetterDetailView.dart';
import 'package:home_and_job/model/chat/response/DirectMessageRoomListDto.dart';
import 'package:home_and_job/utils/Converter.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/home/response/HomeInformationResponse.dart';
import '../../../rest-api/home-api/RoomApi.dart';
import '../../chat-detail-provider/view/ChatProviderDetailView.dart';

class ChatItemWidget extends StatelessWidget {
  DirectMessageRoomListResponse dmItem;
  String myUserId;

  ChatItemWidget(this.dmItem, this.myUserId);

  @override
  Widget build(BuildContext context) {
    String formatDateTime =
        ConverterUtil().formatChatDateTime(dmItem.lastSendDateTime);

    return InkWell(
      onTap: () async {
        //provider 인지 getter 인지 판별
        HomeInformationResponse _home =
            (await RoomApi().loadRoomById(dmItem.progressHomeId))!;
        if (_home.providerId == myUserId) {
          Get.to(() => ChatProviderDetailView(
                receiverId: dmItem.otherUserId,
                roomId: dmItem.id,
                homeId: dmItem.progressHomeId,
              ));
        } else {
          Get.to(() => ChatGetterDetailView(
                receiverId: dmItem.otherUserId,
                roomId: dmItem.id,
                homeId: dmItem.progressHomeId,
              ));
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 340.w,
        height: 70.h,
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.only(top: 30.h, left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        child: CircleAvatar(
                          backgroundColor: kGrey200Color,
                          backgroundImage:
                              AssetImage("assets/images/test/man.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: FBoldText("${dmItem.userNickname}",
                                        kDarkBlue, 15),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 150.w,
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: Text("${dmItem.lastMessage}",
                                        style: TextStyle(
                                            color: kTextBlackColor,
                                            fontSize: 14.sp,
                                            fontFamily: "FRegular",
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        // 텍스트가 넘칠 때 ...으로 표시
                                        maxLines: 1)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        width: 90.w,
                        child: FRegularText(
                            "${formatDateTime}", kGrey600Color, 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
