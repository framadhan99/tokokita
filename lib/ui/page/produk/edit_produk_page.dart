import 'package:flutter/material.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class EditProdukPage extends StatelessWidget {
  const EditProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController kodeProdukController = TextEditingController();
    TextEditingController namaProdukController = TextEditingController();
    TextEditingController hargaProdukController = TextEditingController();
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
