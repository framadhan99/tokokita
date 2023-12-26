import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:tokokita/model/produk.dart';

void main() async {
  await createProduk("kodeProduk", "namaProduk", "10000",
          "5609384b-4261-4350-835e-11075eead4fe")
      .then((value) => print(value));
}

Future<bool> createProduk(
    String kodeProduk, String namaProduk, String harga, String token) async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/produk/create");
  Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    'Authorization': token
  };

  var response = await http.post(url,
      body: {
        'kode_produk': kodeProduk,
        'nama_produk': namaProduk,
        'harga': harga,
      },
      headers: requestHeaders);

  var jsonObj = json.decode(response.body);

  // print(response.body);

  return (jsonObj as Map<String, dynamic>)['status'];
}
