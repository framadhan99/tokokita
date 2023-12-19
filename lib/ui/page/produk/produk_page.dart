import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/produk_form_page.dart';
import 'package:tokokita/ui/widget/item_produk_widget.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Produk"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProdukFormPage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: ListTile(
            title: Text("logout"),
            trailing: Icon(Icons.logout),
            onTap: () {},
          ),
        ),
      ),
      body: ListView(
        children: [
          ItemProduk(
            produk: Produk(
                id: 1,
                kodeProduk: "0001",
                namaProduk: "Kamera",
                hargaProduk: 5000000),
          ),
          ItemProduk(
            produk: Produk(
                id: 2,
                kodeProduk: "0002",
                namaProduk: "Kulkas",
                hargaProduk: 2500000),
          ),
          ItemProduk(
            produk: Produk(
                id: 3,
                kodeProduk: "0003",
                namaProduk: "Mesin Cuci",
                hargaProduk: 2000000),
          )
        ],
      ),
    );
  }
}
