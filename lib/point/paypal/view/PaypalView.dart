import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_and_job/common-widgets/app-bar/CommonAppbar.dart';
import 'package:home_and_job/constants/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/DiskDatabase.dart';

class PayPalPaymentView extends StatefulWidget {
  int amount;


  PayPalPaymentView(this.amount);

  @override
  _PayPalPaymentState createState() => _PayPalPaymentState();
}

class _PayPalPaymentState extends State<PayPalPaymentView> {
  String approvalUrl = ''; // 초기값을 빈 문자열로 설정
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // 초기 웹뷰 컨트롤러 설정
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('success')) {
              // 결제 성공 처리
              print("SUCCESS");
              Navigator.of(context).pop(true);
            } else if (request.url.contains('cancel')) {
              // 결제 취소 처리
              print("CANCEL");
              Navigator.of(context).pop(false);
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    createPayment();
  }

  Future<void> createPayment() async {
    String? accessToken = await DiskDatabase().getAccessToken();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/paypal/create'),
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer $accessToken'
      },
      body: {
        'total': widget.amount.toString(),
        'currency': 'USD',
      },
    );

    print("----------");
    String responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);  // 응답 데이터를 출력해서 확인

    if (response.statusCode == 200) {
      // 정규 표현식을 이용해 approval_url 링크 추출
      final RegExp approvalUrlRegExp = RegExp(r'href=(https:\/\/www\.sandbox\.paypal\.com\/cgi-bin\/webscr\?cmd=_express-checkout&token=[^,]+)');
      final match = approvalUrlRegExp.firstMatch(responseBody);

      if (match != null) {
        String approvalUrl = match.group(1)!;
        setState(() {
          this.approvalUrl = approvalUrl;
          // URL 로드
          _controller.loadRequest(Uri.parse(approvalUrl));
        });
      } else {
        throw Exception('Approval URL not found');
      }
    } else {
      throw Exception('Failed to create payment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: "", color: kWhiteBackGroundColor),
      body: approvalUrl != ''
          ? WebViewWidget(controller: _controller)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
