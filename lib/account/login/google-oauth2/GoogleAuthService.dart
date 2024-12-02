import 'dart:convert';
import 'dart:io'; // Platform 정보를 가져오기 위해 추가
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_and_job/main/main/frame/MainFrameView.dart';
import 'package:home_and_job/rest-api/user-api/LoginApi.dart';
import 'package:home_and_job/rest-api/user-api/SignupApi.dart';
import 'package:home_and_job/utils/ApiUrls.dart';
import 'package:home_and_job/utils/RestApiUtils.dart';
import 'package:http/http.dart' as http;

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // 로그인 취소됨
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final idToken = googleAuth.idToken;

      print("idToken = " + idToken.toString());
      await LoginApi().loginGoogle(idToken);

      print("---4");
    } catch (error) {
      print("Google 로그인 에러: $error");
      return null;
    }
  }
}
