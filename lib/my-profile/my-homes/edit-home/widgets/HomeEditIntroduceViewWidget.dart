import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/constants/Fonts.dart';

/**
 * (1) 주차 가능 여부
 * (2) Women only
 * (3) Shared bathroom (공용 화장실) , (개인 화장실)
 * (4) 관리비
 */
Widget HomeEditIntroduceViewWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40.h, left: 20.w),
        child: Title2Text("Introduce", kTextBlackColor),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h,left: 20.w),
        width: 340.w,
        decoration: BoxDecoration(
          border: Border.all(color: kGrey200Color),
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Center(
          child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 10.w, top: 15.h, bottom: 15.h),
              child: Body2Text(textt, kGrey700Color)),
        ),
      ),
    ],
  );
}

const String textt = """
Ideal for Employed Working Holiday Visa Holders
Close to Cairns CBD - 10 minute walk to Coles & Woolies; Cairns Base & Cairns Private Hospitals
5 minute walk to Domino's Pizza.
24-hour servo just around the corner for middle-of-the-night snacks.
Large kitchen with 2 X 4-burner cook-tops
multiple showers/toilets. Unisex as well as separate boys/girls
Coin-operated laundry.
Quiet: 10 pm Quiet-Zone Rule. No visitors allowed.
Lush tropical gardens. Large open spaces
Salt-water Swimming pool.
Large outdoor entertainment area with recliners
Free on-street parking. Off-street secure parking available for a small fee
Free Wi-fi in most areas. Some rooms may not receive signal.
Free Tea Coffee in Lounge room.
Minimum 4 weeks; Maximum *3 months; 1 week notice to leave.
* = extension after 3 months of stay is negotiable.
""";