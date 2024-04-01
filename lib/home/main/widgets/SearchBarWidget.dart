import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Fonts.dart';

import '../../../constants/Colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _isExpanded = false;
  double _containerHeight = 45.0; // 초기 높이
  double _expandedHeight = 200.h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
          if(_isExpanded) {
            _containerHeight = 200.h;
          }else{
            _containerHeight = 45.h;
          }
        });
      },
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // 애니메이션 지속 시간
          height: _containerHeight,
          margin: EdgeInsets.only(top: 20.h),
          width: 350.w,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200Color),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: !_isExpanded?_buildNotExpaned():_buildExpaned()
        ),
      ),
    );
  }

  Widget _buildExpaned(){
    return Column(
      children: [

        Container(
          width: 150.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: kGrey300Color)
          ),

          child: Center(
            child: HintText("주를 선택하세요!", kGrey500Color),
          ),
        ),
        Container(
          width: 150.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: kGrey300Color)
          ),

          child: Center(
            child: HintText("주를 선택하세요!", kGrey500Color),
          ),
        ),

      ],
    );
  }

  Widget _buildNotExpaned() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: HintText("자세히 찾기", kGrey400Color),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.w),
          child: Icon(Icons.search, color: kGrey400Color,),
        )
      ],
    );
  }
}
