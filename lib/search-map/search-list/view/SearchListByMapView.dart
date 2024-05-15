
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import '../../../model/home/response/HomeResponse.dart';
import '../../../room/room-list/widgets/HomeListItemWidget.dart';

class SearchRoomListByMapView extends StatelessWidget {

  List<HomeResponse?> itmes;


  SearchRoomListByMapView(this.itmes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
                width: 380.w,
                height: 730.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: itmes.length,
                    itemBuilder: (BuildContext ctx, int idx) {
                      return HomeListItemWidget(itmes[idx]);
                    }))
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: kWhiteBackGroundColor,
      automaticallyImplyLeading: false,
      title: Container(
        width: 360.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //여기에 코드 구현

                Navigator.pop(context);
              },
              child: Container(
                  width: 11.w,
                  height: 19.h,
                  child: Icon(Icons.arrow_back_ios)),
            ),
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 0.h, right: 0.w),
                    child: Title3Text("Result ${itmes.length}", kTextBlackColor))),
            Container()
          ],
        ),
      ),
    );
  }
}
