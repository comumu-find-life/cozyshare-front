
import 'package:home_and_job/rest-api/user-api/LoginApi.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService{
  Future<void> signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print(credential.identityToken);

    await LoginApi().loginApple(credential.identityToken);
  }

}