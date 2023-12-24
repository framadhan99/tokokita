import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  await getData("wiwi", "wiwi@gmail.com", "wiwi123");
}

Future getData(String name, String email, String password) async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/users/register");
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
  };

  // String dataEncode = json.encode(dataRegister);

  var response = await http.post(url,
      body: {
        "name": name,
        "email": email,
        "password": password,
      },
      headers: requestHeaders);

  var jsonObject = json.decode(response.body);

  print(response.body);

  return jsonObject;
}
