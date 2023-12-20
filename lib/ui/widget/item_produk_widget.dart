import 'package:flutter/material.dart';

import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/detail_produk_page.dart';

class ItemProduk extends StatelessWidget {
  const ItemProduk({
    Key? key,
    required this.produk,
    this.onTap,
  }) : super(key: key);

  final Produk produk;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk ?? ""),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}
