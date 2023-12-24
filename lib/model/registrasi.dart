// To parse this JSON Registrasi, do
//
//     final registrasi = registrasiFromJson(jsonString);

import 'dart:convert';

class Registrasi {
  final String name;
  final String email;
  final String password;

  Registrasi({
    required this.name,
    required this.email,
    required this.password,
  });

  factory Registrasi.fromJson(Map<String, dynamic> json) => Registrasi(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
