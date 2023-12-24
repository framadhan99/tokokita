import 'dart:convert';

import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? name, String? email, String? password}) async {
    String api = ApiUrl.registrasi;
    var apiUrl = Uri.parse(api);

    var response = await Api().postRegistrasi(url: apiUrl, data: {
      "name": name,
      "email": email,
      "password": password,
    });
    var jsonObject = json.decode(response.body);

    return Registrasi.fromJson(jsonObject);
  }
}
