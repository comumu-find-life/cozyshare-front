

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_and_job/main/main/widgets/BannerWidget.dart';

import '../controller/MainController.dart';
import '../widgets/HotPostWidget.dart';
import '../widgets/MainAppBar.dart';
import '../widgets/MainSearchBar.dart';
import '../widgets/PostHomeWidget.dart';
import '../widgets/SearchHomeWidget.dart';



class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = MainController();
    return Scaffold(
      //appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MainSearchBar(controller),
            PostHomeWidget(controller),
            SearchHomeWidget(controller),
            BannerWidget(controller),
            HotPostWidget(controller)
          ],
        ),
      ),
    );
  }
}
