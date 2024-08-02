import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/chatting/main/controller/ChattingController.dart';
import 'package:home_and_job/chatting/main/widgets/ChatItemWidget.dart';
import 'package:home_and_job/chatting/main/widgets/EmpyyChatWidget.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/utils/ApiUrls.dart';

class ChattingListView extends StatelessWidget {
  ChattingController _controller = ChattingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: _controller.loadAllDmList(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {

            return Container();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    print(ApiUrls.DM_HISTORY);
                  },
                  child: Container(
                    child: Body2Text("dasdasd", kTextBlackColor),
                  ),
                ),
                Center(child: _buildSearchBar()),
                SizedBox(
                  height: 30.h,
                ),
                _controller.chatItems.length == 0
                    ? EmptyChatWidget()
                    : Column(
                        children: _controller.chatItems.map((chatItem) {
                          return ChatItemWidget(chatItem);
                        }).toList(),
                      ),
              ],
            );
          }
        },
      )),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 0.h, left: 0.w),
      width: 340.w,
      height: 43.h,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: TextField(
        controller: _controller.filterController,

        style: TextStyle(color: Colors.black), // 입력된 텍스트의 색상을 검정색으로 변경
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.w, bottom: 0.w),
          hintText: 'Search By City',
          hintStyle:
              TextStyle(color: kDarkBlue, fontSize: 14, fontFamily: "FRegular"),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: kDarkBlue,
            ),
            onPressed: () async {
              //_controller.searchAddresses();
              //await _searchAddresses(_searchController.text);
            },
          ),
        ),
        onChanged: (query) {
          //_controller.filterAddresses(query);
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kWhiteBackGroundColor,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15.h, left: 5.w),
              child: FBoldText("Chats", kTextBlackColor, 15))
        ],
      ),
    );
  }
}
