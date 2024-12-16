import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:home_and_job/protected-deal/common/DealDateTimeWidget.dart';
import 'package:home_and_job/protected-deal/deal-proceeding/getter/popup/AfterDepositCancelPopup.dart';
import 'package:home_and_job/rest-api/deal-api/ProtectedDealApi.dart';
import 'package:home_and_job/utils/Converter.dart';
import 'package:home_and_job/utils/SnackBar.dart';
import '../../../../chatting/chat-detail-getter/controller/ChatGetterDetailController.dart';
import '../../../../constants/Fonts.dart';
import '../../../common/DealInformationWidgetByGetter.dart';
import '../../../common/HomeInformationByDealWidget.dart';
import '../controller/DealProcessControllerByGetter.dart';
import '../widgets/DealFinishAgreeWidget.dart';
import '../../common/widgets/DealProcessWidget.dart';

class DealProcessViewByGetter extends StatelessWidget {
  final int dealId;
  final ChatGetterDetailController _chatDetailController;
  final DealProcessControllerByGetter _controller =
      DealProcessControllerByGetter();

  DealProcessViewByGetter(this.dealId, this._chatDetailController);

  @override
  Widget build(BuildContext context) {
    final dealResponse = _chatDetailController.getDealById(dealId);
    final step = dealResponse?.dealState.getStep();
    //final step = _getStep(dealResponse?.dealState);

    return Scaffold(
      backgroundColor: kWhiteBackGroundColor,
      bottomSheet:  _filterButton(step!, context),
      appBar: CommonAppBar(
        color: kWhiteBackGroundColor,
        canBack: true,
        title: "",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeInformationByDealWidget(_chatDetailController.home.images!.first, _chatDetailController.home.address!, _chatDetailController.home.rent!, _chatDetailController.home.bond!),
            DealDateTimeWidget(ConverterUtil().formatEnglishDateTime(dealResponse!.dealAt)!),
            Container(
              margin: EdgeInsets.only(top: 30.h, left: 15.w),
              child: Title2Text("Transaction Status", kTextBlackColor),
            ),
            Center(
              child: DealProcessWidget(
                createAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.createAt),
                startAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.startAt),
                cancelAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.cancelAt),
                completeAt: ConverterUtil()
                    .formatEnglishDateTime(dealResponse!.completeAt),
              ),
            ),

            Center(
                child: DealPriceWidget(
              deposit: dealResponse!.deposit,
                  fee: dealResponse.fee, totalPrice: dealResponse.totalPrice,

            )),
            if (step == 2) DealFinishAgreeWidget(_controller),
            SizedBox(height: 100.h,)
          ],
        ),
      ),
    );
  }

  Widget _filterButton(int step, BuildContext context) {
    switch (step) {
      case 2:
        return _buildRequestCompleteRequestButton(context);
      default:
        return Container(
          height: 1.h,
        );
    }
  }


  Widget _buildRequestCompleteRequestButton(context){
    return Obx(() => Container(
        height: 70.h,
        color: kWhiteColor,
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                AfterDepositCancelPopup().showPopup(dealId, _controller, context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15.w, bottom: 10.h),
                width: 100.w,
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: kGrey200Color),
                child:
                Center(child: ButtonText("Cancel", kWhiteBackGroundColor)),
              ),
            ),
            InkWell(
              onTap: () async {
                if(_controller.canFinish){
                  var bool = await ProtectedDealApi().completeDeal(dealId);
                  if(bool){
                    _chatDetailController.completeDeal(dealId);
                    Navigator.pop(context);
                  }else{
                    CustomSnackBar().show(context, "failed");
                  }

                }else{
                }

              },
              child: Container(
                  margin: EdgeInsets.only(left: 15.w, bottom: 10.h),
                  width: 215.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: _controller.canFinish ? kBlueColor : kGrey200Color,
                  ),
                  child: Center(
                    child: ButtonText("Complete", kWhiteColor),
                  )),
            ),
          ],
        )));
  }

  // Obx _buildRequestCompleteRequestButton(BuildContext context) {
  //   return Obx(() => _controller.canFinish
  //       ? Container(
  //     width: double.infinity,
  //     color: kPrimaryColor,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: kPrimaryColor,
  //         side: BorderSide.none,
  //         shadowColor: Colors.transparent,
  //       ),
  //       onPressed: () async {
  //         var bool = await ProtectedDealApi().completeDeal(dealId);
  //         if(bool){
  //           _chatDetailController.completeDeal(dealId);
  //         }else{
  //           CustomSnackBar().show(context, "failed");
  //         }
  //
  //         Navigator.pop(context);
  //       },
  //       child: ButtonText("Transaction Complete!", kWhiteBackGroundColor),
  //     ),
  //   )
  //       : Container(
  //     width: double.infinity,
  //     color: kGrey200Color,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: kGrey200Color,
  //         side: BorderSide.none,
  //         shadowColor: Colors.transparent,
  //       ),
  //       onPressed: () async {},
  //       child: ButtonText("Transaction Complete!", kWhiteBackGroundColor),
  //     ),
  //   ));
  // }
}
