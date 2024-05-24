import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/Colors.dart';
import '../../../constants/Fonts.dart';
import '../controller/RoomListController.dart';

class HomeListFilter extends StatelessWidget {
  final RoomListController _controller;

  HomeListFilter(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 10.h),
      width: 340.w,
      child: Row(
        children: [
          _buildType(context),
          _buildPrice(context),
        ],
      ),
    );
  }

  Widget _buildType(BuildContext context) {
    return InkWell(
      onTap: () {
        _showTypeBottomSheet(context);
      },
      child: Container(
        width: 130.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: kGrey400Color)),
        child: Center(
          child: FRegularText("Room Type", kGrey600Color, 14),
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return InkWell(
      onTap: () {
        _showPriceBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 6.w),
        width: 130.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: kGrey400Color)),
        child: Center(
          child: FRegularText("Price", kGrey600Color, 14),
        ),
      ),
    );
  }

  void _showTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text('Rent'),
                onTap: () {
                  _controller.selectHomeType(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Share'),
                onTap: () {
                  _controller.selectHomeType(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPriceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // 여기에 가격 설정을 위한 위젯 추가
              ListTile(
                title: Text('Price 1'),
                onTap: () {
                  // 가격 설정 로직 추가
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Price 2'),
                onTap: () {
                  // 가격 설정 로직 추가
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );

  }
}
