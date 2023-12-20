import 'package:tokokita/model/produk.dart';

class ProdukList {
  final List<Produk> listProduk = [
    Produk(
      id: 1,
      kodeProduk: "0001",
      namaProduk: "Kamera",
      hargaProduk: 5000000,
    ),
    Produk(
      id: 2,
      kodeProduk: "0002",
      namaProduk: "Kulkas",
      hargaProduk: 2500000,
    ),
    Produk(
      id: 3,
      kodeProduk: "0003",
      namaProduk: "Mesin Cuci",
      hargaProduk: 2000000,
    )
  ];
}
