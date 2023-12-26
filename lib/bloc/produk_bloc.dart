import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/produk.dart';
import 'package:http/http.dart' as http;

class ProdukBloc {
  static Future<List<Produk>> getProduk() async {
    Uri url = Uri.parse(ApiUrl.listProduk);
    String? token = await UserInfo().getToken();

    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': token ?? "",
    });

    var jsonObj = json.decode(response.body);
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> produks = [];
    listProduk.forEach((e) {
      produks.add(Produk.fromMap(e));
    });

    return produks;
  }

  static Future<bool> createProduk(
      String kodeProduk, String namaProduk, String harga) async {
    Uri url = Uri.parse(ApiUrl.createProduk);
    String? token = await UserInfo().getToken();

    var response = await http.post(url, body: {
      'kode_produk': kodeProduk,
      'nama_produk': namaProduk,
      'harga': harga,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': token ?? "",
    });

    var jsonObj = json.decode(response.body);
    print(jsonObj);

    return (jsonObj as Map<String, dynamic>)['status'];
  }
}
