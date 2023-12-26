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
    var jsonObj = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   Navigator.pushReplacement(
    //       context!,
    //       MaterialPageRoute(
    //         builder: (context) => const ProdukPage(),
    //       ));
    // } else {
    //   showDialog(
    //     context: context!,
    //     builder: (context) => GeneralDialog(
    //         title: "Gagal",
    //         titleColor: Colors.red,
    //         desc: "Registrasi Gagal",
    //         onPressed: () {
    //           Navigator.pop(context);
    //         }),
    //   );
    // }
    return Login.fromMap(jsonObj);
  }
}
