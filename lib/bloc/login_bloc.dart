import 'dart:convert';

import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/login.dart';
import 'package:http/http.dart' as http;

class LoginBloc {
  static Future<Login?> login({String? email, String? password}) async {
    
    Uri url = Uri.parse(ApiUrl.login);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    }, headers: {
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObj = json.decode(response.body);
      return Login.fromMap(jsonObj);
    }
    return null;
  }
}
