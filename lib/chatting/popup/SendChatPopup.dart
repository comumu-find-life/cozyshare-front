import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/rest-api/chat-api/ChatApi.dart';
import 'package:home_and_job/chatting/chat-detail/view/ChatDetailView.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/model/chat/request/DirectMessageApplicationDto.dart';
import 'package:home_and_job/utils/SnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SendChatPopup {

  void showDialog( BuildContext context,TextEditingController _contentController, int homeId, int receiverId) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                style: TextStyle(fontSize: 16, color: Colors.black),
                child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kWhiteBackGroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180.w,
                                margin: EdgeInsets.only(left: 15.w,top: 20.h),
                                child: Text("Type your message",style: TextStyle(fontSize: 17,color: kTextBlackColor,fontFamily: "boldfont"),),
                              ),

                              InkWell(
                                onTap: (){

                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15.w,top: 15.h),
                                  child: Icon(Icons.cancel,color: Colors.grey,size: 28,),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20.h,left: 10.w,right: 10.w),
                              width: 310.w,
                              height: 250.h,

                              decoration: BoxDecoration(
                                border: Border.all(color: kGrey300Color),
                                  color: kWhiteBackGroundColor,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: TextFormField(
                                style: TextStyle(color: Colors.black), // 텍스트 색상을 검정색으로 설정
                                controller: _contentController,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(

                                  hintText: "",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 25.h,bottom: 25.h, left: 10.w, right: 10.w),
                            width: 310.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                              onTap: ()async{
                                if(_contentController.text == ""){
                                  CustomSnackBar().show(context, "Type your message");
                                }else{
                                  DirectMessageApplicationRequest directMessageApplicationDto = DirectMessageApplicationRequest(message: _contentController.text, receiverId: receiverId, roomId: homeId);
                                  int response = await DmApi().sendInitDm(directMessageApplicationDto);

                                  if(response != -1){
                                    Navigator.pop(context);
                                    Get.to(() => ChatDetailView(receiverId: receiverId, roomId: response, homeId: homeId,));
                                  }else{
                                    CustomSnackBar().show(context, "Error");
                                  }
                                  print(response);
                                }

                              },
                              child: Center(
                                child: Text(
                                  "Send Message",
                                  style: TextStyle(
                                      fontFamily: "boldfont",
                                      fontWeight: FontWeight.bold,
                                      color: kWhiteBackGroundColor,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            );
          });
        });
  }
}