import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:tokokita/model/login.dart';

void main() async {
  await getData("rere@gmail.com", "rere123")
      .then((value) => print(value!.data!.token));
}

Future<Login?> getData(String email, String password) async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/users/login");
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
  };

  // String dataEncode = json.encode(dataRegister);

  var response = await http.post(url,
      body: {
        "email": email,
        "password": password,
      },
      headers: requestHeaders);

  var jsonObject = json.decode(response.body);

  print(response.body);

  return Login.fromMap(jsonObject);
}
