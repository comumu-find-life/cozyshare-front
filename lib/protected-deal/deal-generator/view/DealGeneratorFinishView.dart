
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';
import 'package:home_and_job/main/main/frame/MainFrameView.dart';

class DealGeneratorFinishView extends StatefulWidget {
  const DealGeneratorFinishView({Key? key}) : super(key: key);

  @override
  _DealGeneratorFinishView createState() => _DealGeneratorFinishView();
}

class _DealGeneratorFinishView extends State<DealGeneratorFinishView>  with TickerProviderStateMixin{

  late AnimationController scaleController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
  late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);
  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {

    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 150;
    double iconSize = 108;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,

      body: InkWell(
        onTap: (){
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);

        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.3,),
              Center(
                child: Title1Text("Success Save Deal", kDarkBlue),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
                child: Body2Text("Touch Screen!", kTextBlackColor),
              ),
              SizedBox(height: size.height*0.03,),
              ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                    color: kBlueColor,
                    shape: BoxShape.circle,
                  ),
                  child: SizeTransition(
                      sizeFactor: checkAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Center(
                          child: Icon(Icons.check, color: Colors.white, size: iconSize)
                      )
                  ),
                ),
              ),
              SizedBox(height: size.height*0.4,),

            ],
          ),
        ),
      ),
    );
  }
}