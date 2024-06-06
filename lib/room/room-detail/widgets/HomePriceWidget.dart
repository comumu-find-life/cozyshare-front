import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/model/home/response/HomeInformationResponse.dart';

/**
 * (1) 주차 가능 여부
 * (2) Women only
 * (3) Shared bathroom (공용 화장실) , (개인 화장실)
 * (4) 관리비
 */
// Widget HomePriceWidget(HomeInformationResponse homeInformationResponse) {
//
// }

class HomePriceWidget extends StatelessWidget {
  HomeInformationResponse homeInformationResponse;


  HomePriceWidget(this.homeInformationResponse);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Title2Text("Room Price", kTextBlackColor),
        ),
        _buildWeeklyRent(),
        _buildDeposit(),
        _buildUtilityBill(),
        // Center(
        //   child: Container(
        //     margin: EdgeInsets.only(top: 30.h),
        //     width: 340.w,
        //     height: 1.h,
        //     color: kGrey100Color,
        //   ),
        // ),
        _buildTotalPrice(),
      ],
    );
  }
  Widget _buildTotalPrice() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, top: 40.h),
          width: 330.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: FBoldText("Price per month", kGrey800Color, 15),
              ),
              Container(
                child: NumberText("\$${calulcateTotalPrice()} + a", kBlueColor, 14),
              ),
            ],
          ),
        ),

      ],
    );
  }

  Widget _buildWeeklyRent() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Weekly rent", kGrey800Color),
          ),
          Container(
            child: NumberText("\$${homeInformationResponse.rent}", kGrey800Color, 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDeposit() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Bond", kGrey800Color),
          ),
          Container(
            child: NumberText("\$${homeInformationResponse.bond}", kGrey800Color, 14),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilityBill() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, top: 20.h),
      width: 330.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Body1Text("Utility bill", kGrey800Color),
          ),
          Container(
            child: NumberText("\$${homeInformationResponse.bill}", kGrey800Color, 14),
          ),
        ],
      ),
    );
  }

  String? calulcateTotalPrice(){
      int rent = homeInformationResponse.rent ?? 0;
      int bill = homeInformationResponse.bill ?? 0;
      int totalPrice = rent + bill;
      return totalPrice.toString();
  }
}


