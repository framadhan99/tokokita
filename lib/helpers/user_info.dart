import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  // untuk mendapakan token atau menyimpan token di shared_preferences
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }

  // untuk menampilkan atau untuk mendapatkan token dari shared_preferences
  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  // buat menyimpan user id
  Future setUserID(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt("userID", value);
  }

  // untuk mendapatkan user id
  Future<int?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("userID");
  }

  // untuk menghapus preferences yang sudah di simpan
  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
