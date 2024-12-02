import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_and_job/model/user/response/UserAccountResponse.dart';
import 'package:home_and_job/rest-api/user-api/UserPointApi.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:home_and_job/utils/SnackBar.dart';

import '../../../../my-profile/my-homes/edit-home/detail-view/view/FinishView.dart';
import '../../../bank-transfer/view/BankTransferView.dart';
import '../../../bank-transfer/view/InputBankTransferFormView.dart';
import '../../../paypal/view/PaypalView.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:async';


class ChargePointController extends GetxController {
  RxInt paymentMethod = 0.obs;
  late UserAccountResponse userAccountResponse;
  TextEditingController amountController = TextEditingController();
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  // 사용 가능한 상품 리스트
  final List<String> _productIds = [
    'point_1000',
    'point_5000',
    'point_10000'
  ]; // 상품 ID 예제

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  bool _isAvailable = false;
  List<ProductDetails> _products = [
    ProductDetails(id: "point_1000",
        title: "1000",
        description: "de",
        price: "1000",
        currencyCode: "1", rawPrice: 10)
  ];

  @override
  void onInit() {
    super.onInit();
    _initializeInAppPurchase();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  Future<bool> setInit(UserAccountResponse userAccount) async {
    userAccountResponse = userAccount;
    return true;
  }

  void onTapPaymentMethod(int value) {
    paymentMethod.value = value;
  }

  Future<void> _initializeInAppPurchase() async {
    _isAvailable = await _inAppPurchase.isAvailable();
    if (_isAvailable) {
      _subscription =
          _inAppPurchase.purchaseStream.listen((purchaseDetailsList) {
            _handlePurchaseUpdates(purchaseDetailsList);
          }, onDone: () {
            _subscription.cancel();
          }, onError: (error) {
            print("Purchase stream error: $error");
          });

      final ProductDetailsResponse response =
      await _inAppPurchase.queryProductDetails(_productIds.toSet());
      if (response.error != null) {
        print("Error loading products: ${response.error}");
        return;
      }
      _products = response.productDetails;
    } else {
      print("In-app purchases are not available on this device.");
    }
  }

  void moveChargeView(BuildContext context) {
    if (amountController.text.isEmpty) {
      CustomSnackBar().show(context, "Please enter the recharge amount.");
      return;
    }

    final int amount = int.tryParse(amountController.text) ?? 0;
    if (amount <= 0) {
      CustomSnackBar().show(context, "Invalid recharge amount.");
      return;
    }

    // 금액에 따른 상품 매칭
    final String productId = _getProductIdForAmount(amount);

    if (productId.isEmpty) {
      CustomSnackBar().show(context, "No product available for this amount.");
      return;
    }

    // 결제 요청
    final ProductDetails? product = _products.firstWhereOrNull((p) =>
    p.id == productId);


    if (product != null) {
      final PurchaseParam purchaseParam = PurchaseParam(
          productDetails: product);
      print("object");

      _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
    } else {
      CustomSnackBar().show(context, "Product not found.");
    }
  }

  String _getProductIdForAmount(int amount) {
    if (amount <= 1000) {
      return 'point_1000';
    } else if (amount <= 5000) {
      return 'point_5000';
    } else if (amount <= 10000) {
      return 'point_10000';
    }
    return '';
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.purchased) {
        _verifyPurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        print("Purchase error: ${purchaseDetails.error}");
      }
    }
  }

  Future<void> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    // 서버 검증 및 포인트 충전 로직
    // 서버와 통신하여 구매 확인 및 포인트 충전 처리
    print("Purchase verified: ${purchaseDetails.productID}");
  }
}
