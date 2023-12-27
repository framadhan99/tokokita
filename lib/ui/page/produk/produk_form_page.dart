import 'package:flutter/material.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class ProdukFormPage extends StatefulWidget {
  const ProdukFormPage({super.key});

  @override
  State<ProdukFormPage> createState() => _ProdukFormPageState();
}

class _ProdukFormPageState extends State<ProdukFormPage> {
  TextEditingController kodeProdukController = TextEditingController();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
