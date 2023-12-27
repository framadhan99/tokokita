import 'dart:convert';

class Registrasi {
  int? code;
  bool? status;
  String? message;
  Data? data;
  Registrasi({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory Registrasi.fromMap(Map<String, dynamic> map) {
    return Registrasi(
      code: map['code']?.toInt(),
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Registrasi.fromJson(String source) =>
      Registrasi.fromMap(json.decode(source));
}

class Data {
  int? id;
  String? name;
  String? email;
  Data({
    this.id,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
