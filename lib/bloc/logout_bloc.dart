import 'dart:convert';

import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:http/http.dart' as http;

class LogoutBloc {
  static Future<String> logout(String token) async {
    Uri url = Uri.parse(ApiUrl.logout);

    var response = await http.delete(url, headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });
    await UserInfo().logout();
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['message'];
  }
}
