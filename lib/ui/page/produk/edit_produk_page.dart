import 'package:flutter/material.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class EditProdukPage extends StatefulWidget {
  const EditProdukPage(
      {Key? key,
      // required this.produk,
      k})
      : super(key: key);

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  TextEditingController kodeProdukController = TextEditingController();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();

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
              // initialValue: kodeProdukController.text,
              label: "Kode Produk",
            ),
            // _namaProdukField
            GeneralTextField(
              controller: namaProdukController,
              // initialValue: namaProdukController.text,
              label: "Nama Produk",
            ),
            // _hargaProdukField
            GeneralTextField(
              controller: hargaProdukController,
              // initialValue: hargaProdukController.text,
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
