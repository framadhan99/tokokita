import 'package:flutter/material.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

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
                  "Kode :",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Nama :",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Harga :",
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
                      onPressed: () {},
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
