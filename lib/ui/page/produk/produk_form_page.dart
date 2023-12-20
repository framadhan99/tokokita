import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tokokita/model/list_produk.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class ProdukFormPage extends StatelessWidget {
  const ProdukFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController kodeProdukController = TextEditingController();
    TextEditingController namaProdukController = TextEditingController();
    TextEditingController hargaProdukController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Produk Form")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // _kodeProdukField
            GeneralTextField(
              controller: kodeProdukController,
              label: "Kode Produk",
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
            // _namaProdukField
            GeneralTextField(
              controller: namaProdukController,
              label: "Nama Produk",
            ),
            // _hargaProdukField
            GeneralTextField(
              controller: hargaProdukController,
              label: "Harga Produk",
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                var id = Random();
                ProdukList listProduk = ProdukList();

                Produk produk = Produk(
                  id: id.nextInt(100),
                  kodeProduk: kodeProdukController.text,
                  namaProduk: namaProdukController.text,
                  hargaProduk: int.parse(hargaProdukController.text),
                );

                listProduk.listProduk.add(produk);

                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
