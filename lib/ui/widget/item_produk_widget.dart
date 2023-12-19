import 'package:flutter/material.dart';

import 'package:tokokita/model/produk.dart';

class ItemProduk extends StatelessWidget {
  const ItemProduk({
    Key? key,
    required this.produk,
  }) : super(key: key);

  final Produk produk;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk ?? ""),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}
