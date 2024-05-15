
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants/Colors.dart';
import '../controller/HomeDetailController.dart';

AppBar HomeDetailAppbar(HomeDetailController _controller,int? homeId, BuildContext context){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: kWhiteBackGroundColor,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        Obx(() => InkWell(
            onTap: () {
              _controller.ontapFavorite(homeId);
            },
            child: _controller.isFavorite
                ? Container(
              child: Icon(
                Icons.favorite,
                color: kErrorColor,
              ),
            )
                : Container(
              child: Icon(
                Icons.favorite_border,
                color: kGrey400Color,
              ),
            )))
      ],
    ),
  );
}