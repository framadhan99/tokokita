class Login {
  int? code;
  bool? status;
  String? token;
  int? UserID;
  String? userEmail;
  Login({
    this.code,
    this.status,
    this.token,
    this.UserID,
    this.userEmail,
  });

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
        code: obj['code'],
        status: obj['status'],
        token: obj['data']['token'],
        UserID: obj['data']['user']['id'],
        userEmail: obj['data']['user']['email']);
  }
}
