import 'dart:convert';

class Login {
  int? code;
  bool? status;
  Data? data;
  Login({
    this.code,
    this.status,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'data': data?.toMap(),
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      code: map['code']?.toInt() ?? 0,
      status: map['status'] ?? false,
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));
}

class Data {
  String? token;
  User? user;
  Data({
    this.token,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user': user?.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      token: map['token'] ?? "",
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class User {
  int? id;
  String? email;
  User({
    this.id,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(id: $id, email: $email)';
}
