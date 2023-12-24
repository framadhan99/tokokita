import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokokita/model/list_produk.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/detail_produk_page.dart';
import 'package:tokokita/ui/page/produk/produk_form_page.dart';
import 'package:tokokita/ui/widget/item_produk_widget.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProdukList produk = ProdukList();
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
            ...List.generate(
              produk.listProduk.length,
              (index) => ItemProduk(
                produk: Produk(
                  id: produk.listProduk[index].id,
                  kodeProduk: produk.listProduk[index].kodeProduk,
                  namaProduk: produk.listProduk[index].namaProduk,
                  hargaProduk: produk.listProduk[index].hargaProduk,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailProdukPage(produk: produk, index: index),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
