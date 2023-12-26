import 'dart:convert';

class ListProduk {
  List<Produk?>? listProduk;
  ListProduk({
    this.listProduk,
  });

  Map<String, dynamic> toMap() {
    return {
      'listProduk': listProduk?.map((x) => x?.toMap()).toList(),
    };
  }

  factory ListProduk.fromMap(Map<String, dynamic> map) {
    return ListProduk(
      listProduk: map['listProduk'] != null
          ? List<Produk?>.from(
              map['listProduk']?.map((x) => Produk?.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListProduk.fromJson(String source) =>
      ListProduk.fromMap(json.decode(source));
}

class Produk {
  int? id;
  String? kode_produk;
  String? nama_produk;
  int? harga;
  String? created_at;
  String? update_at;
  Produk({
    this.id,
    this.kode_produk,
    this.nama_produk,
    this.harga,
    this.created_at,
    this.update_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kode_produk': kode_produk,
      'nama_produk': nama_produk,
      'harga': harga,
      'created_at': created_at,
      'update_at': update_at,
    };
  }

  factory Produk.fromMap(Map<String, dynamic> map) {
    return Produk(
      id: map['id']?.toInt(),
      kode_produk: map['kode_produk'],
      nama_produk: map['nama_produk'],
      harga: map['harga']?.toInt(),
      created_at: map['created_at'],
      update_at: map['update_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Produk.fromJson(String source) => Produk.fromMap(json.decode(source));
}
