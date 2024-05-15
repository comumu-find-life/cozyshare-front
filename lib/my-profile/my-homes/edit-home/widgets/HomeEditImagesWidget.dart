import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

class HomeEditImagesWidget extends StatefulWidget {
  const HomeEditImagesWidget({Key? key}) : super(key: key);

  @override
  _HomeEditImagesWidgetState createState() => _HomeEditImagesWidgetState();
}

class _HomeEditImagesWidgetState extends State<HomeEditImagesWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 400.h,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildImage("assets/images/test/home.png"),
              _buildImage("assets/images/test/home1.png"),
              _buildImage("assets/images/test/home2.png"),
              // Add more images here
            ],
          ),
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: Container(
              width: 50.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: kGrey500Color
              ),
              child:Center(
                child: Body2Text(
                  "${_currentPage + 1}/${3}", // Change 3 to the total number of images
                  kWhiteBackGroundColor,
                ),
              ),
            )
          ),
          Positioned(
            top: 150.h,
            left: 10.w,
            child: IconButton(
              color: kWhiteBackGroundColor,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          Positioned(
            top: 150.h,
            right: 10.w,
            child: IconButton(
              color: kWhiteBackGroundColor,
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}
