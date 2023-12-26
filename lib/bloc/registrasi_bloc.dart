import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/registrasi.dart';
import 'package:http/http.dart' as http;
import 'package:tokokita/ui/widget/general_dialog.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? name,
      String? email,
      String? password,
      BuildContext? context}) async {
    String api = ApiUrl.registrasi;
    var apiUrl = Uri.parse(api);

    var response = await http.post(apiUrl, body: {
      "name": name,
      "email": email,
      "password": password,
    });
    var jsonObject = json.decode(response.body);
    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context!,
        builder: (context) => GeneralDialog(
            title: "SUKSES",
            titleColor: Colors.green,
            desc: "Registrasi Berhasil",
            onPressed: () {
              Navigator.pop(context);
            }),
      );
    } else {
      showDialog(
        context: context!,
        builder: (context) => GeneralDialog(
            title: "Gagal",
            titleColor: Colors.red,
            desc: "Registrasi Gagal",
            onPressed: () {
              Navigator.pop(context);
            }),
      );
    }

    return Registrasi.fromJson(jsonObject);
  }
}
