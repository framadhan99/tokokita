import 'dart:convert';

import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/registrasi.dart';
import 'package:http/http.dart' as http;

class RegistrasiBloc {
  static Future<Registrasi> registrasi({
    // data yang akan di post ke rest Api register
    String? name,
    String? email,
    String? password,
  }) async {
    // get api url
    String api = ApiUrl.registrasi; // "$baseUrl/users/register"
    var apiUrl = Uri.parse(api); // untuk convert tipe data string ke Uri

    var response = await http.post(apiUrl, body: {
      'name': name,
      'email': email,
      'password': password,
    }, headers: {
      'Accept': 'application/json'
    });

    var jsonObject = json.decode(response.body);

    return Registrasi.fromMap(jsonObject);
  }
}
