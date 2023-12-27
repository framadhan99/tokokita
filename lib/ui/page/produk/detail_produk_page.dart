import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';

import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/edit_produk_page.dart';
import 'package:tokokita/ui/page/produk/produk_page.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({
    Key? key,
    required this.produk,
  }) : super(key: key);
  final Produk produk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Produk")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Kode : ${produk.id}",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Nama : ${produk.nama_produk}",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Harga :${produk.harga}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Edit"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProdukPage(
                              id: produk.id ?? 0,
                              produk: produk,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () async {
                        await ProdukBloc.delete(produk.id!).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Berhasil di hapus"),
                            ),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProdukPage(),
                              ));
                        });
                      },
                      child: Text("Delete"),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
