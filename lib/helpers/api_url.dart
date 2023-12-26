class ApiUrl {
  static const String baseUrl = "http://10.0.2.2/api";

  static const String registrasi = "http://10.0.2.2:8000/api/users/register";
  static const String login = "http://10.0.2.2:8000/api/users/login";
  static const String listProduk = "$baseUrl/produk/list";
  static const String createProduk = "$baseUrl/produk/create";

  static String updateProduk(int id) {
    return "$baseUrl/produk/update/$id";
  }

  static String showProduk(int id) {
    return "$baseUrl/produk/$id";
  }

  static String deleteProduk(int id) {
    return "$baseUrl/produk/delete/$id";
  }
}
