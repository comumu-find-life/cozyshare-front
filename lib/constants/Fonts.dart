
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget FBoldText(String text, Color color, int size){
  return Text("${text}", style: TextStyle(color : color, fontSize: size.sp, fontFamily: "FBold", fontWeight: FontWeight.w700),);
}

Widget FRegularText(String text, Color color, int size){
  return Text("${text}", style: TextStyle(color : color, fontSize: size.sp, fontFamily: "FRegular", fontWeight: FontWeight.w500),);
}

Widget FThinText(String text, Color color, int size){
  return Text("${text}", style: TextStyle(color : color, fontSize: size.sp, fontFamily: "FThin", fontWeight: FontWeight.w500),);
}

Widget Body1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Body1", fontWeight: FontWeight.w500),);
}

Widget Body2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp, fontFamily:  "Body2", fontWeight: FontWeight.w500),);
}

Widget LargeTitleText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 35.sp, fontFamily: "LargeTitle" , fontWeight: FontWeight.w900),);
}

Widget PercentageText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 20.sp, fontFamily: "Percentage", fontWeight: FontWeight.w900),);
}

Widget PretandardText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 18.sp, fontFamily: "Pretandard", fontWeight: FontWeight.w600),);
}


Widget NumberText(String text, Color color, int fontSize){
  return Text("${text}", style: TextStyle(color : color, fontSize: fontSize.sp, fontFamily: "Number", fontWeight: FontWeight.w600),);
}

Widget Title1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 24.sp , fontFamily: "Title1", fontWeight: FontWeight.w900),);
}

Widget Title2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 19.sp, fontFamily: "Title2", fontWeight: FontWeight.w800),);
}

Widget Title3Text(String text, Color color){
  return Text("${text}",overflow: TextOverflow.ellipsis, style: TextStyle(color : color, fontSize: 15.sp, fontFamily: "Title3", fontWeight: FontWeight.w700),);
}

Widget SubTitle1Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp , fontFamily: "SubTitle1", fontWeight: FontWeight.w700),);
}

Widget SubTitle2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 14.sp, fontFamily: "SubTitle2", fontWeight: FontWeight.w600),);
}

Widget HintText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 20.sp, fontFamily: "Hint", fontWeight: FontWeight.w100),);
}


Widget HintText2(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 12.sp, fontFamily: "Hint", fontWeight: FontWeight.w100),);
}

Widget HintText3(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 13.sp, fontFamily: "Hint", fontWeight: FontWeight.bold),);
}

Widget ChipText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp, fontFamily: "Chip", fontWeight: FontWeight.w600),);
}

Widget ButtonText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 16.sp , fontFamily: "Button", fontWeight: FontWeight.w600),);
}

Widget HelperText(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 12.sp , fontFamily: "Helper", fontWeight: FontWeight.w500),);
}

Widget Helper2Text(String text, Color color){
  return Text("${text}", style: TextStyle(color : color, fontSize: 13.sp , fontFamily: "Helper2", fontWeight: FontWeight.w500),);
}