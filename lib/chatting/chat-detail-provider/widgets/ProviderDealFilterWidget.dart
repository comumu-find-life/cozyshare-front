// import 'package:flutter/material.dart';
//
// import '../../../model/deal/response/ProtectedDealByProviderResponse.dart';
// import '../controller/ChatGetterDetailController.dart';
//
// class ProviderDealFilterWidget extends StatelessWidget {
//   final int dealId;
//   final ChatProviderDetailController controller;
//
//   ProviderDealFilterWidget({required this.dealId, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ProtectedDealByProviderResponse?>(
//       future: controller.findDealById(dealId), // 비동기 함수 호출
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // 데이터를 불러오는 동안 로딩 스피너 표시
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           // 에러가 발생했을 때 처리
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (snapshot.hasData && snapshot.data != null) {
//           // 데이터를 성공적으로 불러왔을 때
//           ProtectedDealByProviderResponse dealResponse = snapshot.data!;
//           return _buildDealMessage(dealResponse.);
//         } else {
//           // 데이터가 없을 경우
//           return SizedBox.shrink();
//         }
//       },
//     );
//   }
//
//   Widget _buildDealMessage(int isDeal) {
//     switch (isDeal) {
//       case 1:
//         return ProviderDealStartMessageWidget(controller);
//       case 2:
//         return ProviderDealDuringMessageWidget(controller);
//       case 3:
//         return ProviderDealFinishWidget();
//       default:
//         return SizedBox.shrink();
//     }
//   }
// }
