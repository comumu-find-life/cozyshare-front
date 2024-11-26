

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/account/login/widgets/MainLoginTextWidget.dart';
import 'package:home_and_job/chatting/chat-common/widgets/ChatAppBar.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class SaveDealGuideLineView extends StatelessWidget {
  const SaveDealGuideLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CommonAppBar(canBack: true,color: kWhiteBackGroundColor,title: "",),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h,left: 15.w),
              child: FBoldText("What is Safe Transaction?", kTextBlackColor, 15),
            ),

            _buildExplain(),
            _buildStep1(),
            _buildStep2(),
            _buildStep3(),
            _buildStep4(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplain(){
    return Center(
      child: Container(
        width: 345.w,
        height: 160.h,
        margin: EdgeInsets.only(top: 15.h),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: FRegularText("Safe Transaction is a feature that safely holds the earnest money between the tenant and the landlord.", kTextBlackColor, 14),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FRegularText("Once the deal is finalized, the earnest money is transferred to the landlord. (This feature is not used if no earnest money is required.)", kTextBlackColor, 14),
            )
          ],
        ),
      ),
    );
  }
  
  Widget _buildContent(){
    return Column(
      children: [
        
      ],
    );
  }

  Widget _buildStep1(){
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h, right: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.looks_one, color: kPrimaryColor,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),

                width: 310.w,
                child: FBoldText("The tenant initiates a Safe transaction within the chat room.", kTextBlackColor, 14),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 340.w,
              child: Image.asset("assets/images/safe-deal/deal1.jpg"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStep2(){
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h, right: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.looks_two, color: kPrimaryColor,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),

                width: 310.w,
                child: FBoldText("The tenant initiates a Safe transaction within the chat room.", kTextBlackColor, 14),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 340.w,
              child: Image.asset("assets/images/safe-deal/deal2.jpg"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStep3(){
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h, right: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.looks_3, color: kPrimaryColor,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),

                width: 310.w,
                child: FBoldText("After meeting in person and confirming the property, the tenant presses the 'Complete Secure Transaction' button if the deal is successful. (The earnest money is then transferred to the landlord.)", kTextBlackColor, 14),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 340.w,
              child: Image.asset("assets/images/safe-deal/deal1.jpg"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStep4(){
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 30.h, right: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.looks_4, color: kPrimaryColor,),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w),

                width: 310.w,
                child: FBoldText("If the listing is fraudulent or the transaction needs to be canceled, the tenant presses the 'Cancel Transaction' button. (In this case, the earnest money is returned to the tenant.)", kTextBlackColor, 14),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 340.w,
              child: Image.asset("assets/images/safe-deal/deal1.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
