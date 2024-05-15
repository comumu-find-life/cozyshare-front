import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class ProfileDetailHeader extends StatelessWidget {
  const ProfileDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 340.w,

        child: Stack(
          children: [

            Container(
              margin: EdgeInsets.only(top: 50.h),
              width: 340.w,
              height: 200.h,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    child: FBoldText("sinminseok", kTextBlackColor, 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 57.h),
                    width: 250.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //my rooms
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: FRegularText("Rooms", kGrey700Color, 14),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: FRegularText("15", kGrey700Color, 14),
                              ),
                            ],
                          ),
                        ),
                        //my deal
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: FRegularText("Deals", kGrey700Color, 14),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: FRegularText("15", kGrey700Color, 14),
                              ),
                            ],
                          ),
                        ),
                        //
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: FRegularText("Like", kGrey700Color, 14),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: FRegularText("15", kGrey700Color, 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
            Center(
              child: Container(
                width: 85.w,
                height: 85.h,
                child: CircleAvatar(
                  backgroundColor: kGrey200Color,
                  backgroundImage: AssetImage("assets/images/test/man.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
