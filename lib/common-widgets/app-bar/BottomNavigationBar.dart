import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';

import '../../constants/Fonts.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> titleList;

  BottomNavigationWidget(this.defaultSelectedIndex, this.onChange,
      this.iconList, this.titleList);

  @override
  _BottomNavigationWidget createState() => _BottomNavigationWidget();
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _title = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _title = widget.titleList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_title[i], _iconList[i], i));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          top: BorderSide(width: 1, color: kGrey200Color),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(String title, IconData icon, int index) {
    return GestureDetector(
        onTap: () {
          widget.onChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          height: 73.h,
          width: 70.w,
          child: Column(
            children: [
              Container(
                width: 25.w,
                height: 21.h,
                margin: EdgeInsets.only(top: 10.h),
                child:  Icon(
                  icon,
                  size: 24,
                  color: index == _selectedIndex ? kBlueColor : Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Center(
                  child: HelperText(
                    title,
                    index == _selectedIndex ? kGrey800Color : kGrey400Color,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}