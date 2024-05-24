// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:home_and_job/chatting/chat-detail/controller/ChatDetailController.dart';
// import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
// import 'package:home_and_job/constants/Colors.dart';
//
// import '../../../../constants/Fonts.dart';
// import '../../../../protected-deal/deal-request/getter/widgets/DepositInformationWidgetByGetter.dart';
// import '../../../deal-request/getter/widgets/DealInformationWidgetByGetter.dart';
// import '../../common/widgets/DealProcessWidget.dart';
// import '../../common/widgets/DepositGuideWidget.dart';
// import '../../getter/controller/DealProcessControllerByGetter.dart';
// import '../../getter/widgets/DealFinishAgreeWidget.dart';
//
// /**
//  * Getter 메시지 쪽에서 보여줘야하고, Provider 는 단순 조회, Getter 는 거래 완료만 누를 수 있다.
//  */
// class DealProcessViewByProvider extends StatelessWidget {
//   ChatDetailController _chatDetailController;
//   DealProcessControllerByGetter _controller = DealProcessControllerByGetter();
//
//
//   DealProcessViewByProvider(this._chatDetailController);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteBackGroundColor,
//       appBar: CommonAppBar(
//         color: kWhiteBackGroundColor,
//         canBack: true,
//         title: "",
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Obx(() => Center(child: DealProcessWidget(_controller.dealLevel))),
//             //DepositGuideWidget(),
//             Center(child: DealInformationWidgetByGetter()),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Obx _buildStepOneButton(BuildContext context) {
//     return Obx(() => Container(
//       width: double.infinity,
//       color: _controller.canFinish ? kBlueColor : kGrey200Color,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//           _controller.canFinish ? kBlueColor : kGrey200Color,
//           //padding: EdgeInsets.symmetric(vertical: 14),
//           side: BorderSide.none, // 테두리 없애기
//           shadowColor: Colors.transparent, // 그림자 없애기
//         ),
//         onPressed: () {
//           //_controller.ontapStep1Next();
//           if( _controller.canFinish){
//             _chatDetailController.confirmDeal();
//             _controller.canFinish ? Navigator.pop(context) : null;
//           }
//
//         },
//         child: ButtonText("거래 확정", kWhiteBackGroundColor),
//       ),
//     ));
//   }
// }
//
