import 'package:flutter/material.dart';

import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/detail_produk_page.dart';

class ItemProduk extends StatelessWidget {
  const ItemProduk({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
