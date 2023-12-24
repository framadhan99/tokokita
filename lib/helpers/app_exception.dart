import 'package:flutter/material.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;
  AppException({
    this.message,
    this.prefix,
  });

  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message: "Error During Comunication: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message: "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message: "Unauthorised: ");
}

class UnprocessableEntityException extends AppException {
  UnprocessableEntityException([String? message])
      : super(message: "Unprocessable Entity: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message: "Invalid Input: ");
}
