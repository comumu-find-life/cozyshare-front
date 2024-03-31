
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginApi  with ChangeNotifier {
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> test2() async{

    //GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  }

  Future<bool?> googleOauth2() async {

    var res = await http.get(

      Uri.parse("http://10.0.2.2:8080/oauth2/authorization/google"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer ${prefs.getString("token")}',
      },
    );

    print(res.headers);

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> test() async {

    var res = await http.get(
      Uri.parse("http://10.0.2.2:8080/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer ${prefs.getString("token")}',
      },
    );

    print(res.headers);

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}