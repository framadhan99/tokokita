import 'package:flutter/material.dart';

import 'package:tokokita/model/list_produk.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class EditProdukPage extends StatefulWidget {
  const EditProdukPage({
    Key? key,
    required this.produk,
    required this.index,
  }) : super(key: key);

  final ProdukList produk;
  final int index;

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  TextEditingController kodeProdukController = TextEditingController();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Produk")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            // _kodeProdukField
            GeneralTextField(
              controller: kodeProdukController,
              label: "Kode Produk",
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
            ElevatedButton(onPressed: () {}, child: Text("Ubah"))
          ],
        ),
      ),
    );
  }
}
