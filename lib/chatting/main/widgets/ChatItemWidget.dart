import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/chatting/chat-detail-getter/view/ChatGetterDetailView.dart';
import 'package:home_and_job/model/chat/response/DirectMessageRoomListDto.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../../../model/home/response/HomeInformationResponse.dart';
import '../../../rest-api/home-api/RoomApi.dart';
import '../../chat-detail-provider/view/ChatProviderDetailView.dart';

class ChatItemWidget extends StatelessWidget {

  DirectMessageRoomListDto dmItem;
  String myUserId;

  ChatItemWidget(this.dmItem, this.myUserId);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        //provider 인지 getter 인지 판별
        HomeInformationResponse _home = (await RoomApi().loadRoomById(dmItem.progressHomeId))!;
        if(_home.providerId == myUserId){
          Get.to(() => ChatProviderDetailView(receiverId: dmItem.userId, roomId: dmItem.id, homeId: dmItem.progressHomeId,));
        }else{
          Get.to(() => ChatGetterDetailView(receiverId: dmItem.userId, roomId: dmItem.id, homeId: dmItem.progressHomeId,));
        }


      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 330.w,
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
                              width: 220.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: FBoldText(
                                        "${dmItem.userNickname}", kDarkBlue, 15),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  child:
                                      FRegularText("${dmItem.lastMessage}", kGrey700Color, 13),
                                ),
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
                        child: FRegularText("02.15", kGrey600Color, 12),
                      ),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        margin: EdgeInsets.only(top: 4.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kDarkBlue),
                        child: Center(
                            child: FBoldText("1", kWhiteBackGroundColor, 14)),
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
