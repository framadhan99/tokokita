import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tokokita/helpers/app_exception.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:http/http.dart' as http;
import 'package:tokokita/model/registrasi.dart';

class Api {
  Future<dynamic> postRegistrasi({Uri? url, dynamic data}) async {
    var response = await http.post(url ?? Uri.parse(""), body: data, headers: {
      'Accept': 'application/json',
    });

    return response;
  }

  Future<dynamic> post(Uri url, dynamic data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.post(url,
          body: data, headers: {HttpHeaders.authorizationHeader: "$token"});
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(Uri url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: "$token"});
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(Uri url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http
          .delete(url, headers: {HttpHeaders.authorizationHeader: "$token"});
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}

// dynamic _returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       return response;
//     case 400:
//       throw BadRequestException(response.body.toString());
//     case 401:
//     case 403:
//       throw UnauthorisedException(response.body.toString());
//     case 422:
//       throw InvalidInputException(response.body.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           "Erron occured while communication with server with statusCode: ${response.statusCode}");
//   }
// }
