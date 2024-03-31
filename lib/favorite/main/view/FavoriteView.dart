

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/favorite/main/controller/FavoriteController.dart';
import 'package:home_and_job/favorite/main/widgets/FavoritePostWidget.dart';
import 'package:home_and_job/favorite/main/widgets/SelectFavoriteType.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController _controller = FavoriteController();

    return Scaffold(
      appBar: CommonAppBar(canBack: false, title: '찜목록', color: kWhiteBackGroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectFavoriteType(_controller),
            FavoritePostWidget(_controller)

          ],
        ),
      ),
    );
  }
}
