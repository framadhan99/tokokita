import 'package:flutter/material.dart';

import 'package:tokokita/model/list_produk.dart';
import 'package:tokokita/ui/page/produk/edit_produk_page.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({
    Key? key,
    required this.produk,
    required this.index,
  }) : super(key: key);

  final ProdukList produk;
  final int index;

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
                  "Kode : ${produk.listProduk[index].id}",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Nama : ${produk.listProduk[index].namaProduk}",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Harga :${produk.listProduk[index].hargaProduk}",
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
                                produk: produk,
                                index: index,
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
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
