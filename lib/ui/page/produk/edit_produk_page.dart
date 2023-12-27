import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/detail_produk_page.dart';
import 'package:tokokita/ui/page/produk/produk_page.dart';
import 'package:tokokita/ui/widget/general_dialog.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class EditProdukPage extends StatefulWidget {
  const EditProdukPage(
      {Key? key,
      // required this.produk,
      required this.id,
      required this.produk})
      : super(key: key);

  // final ProdukList produk;
  final int id;
  final Produk produk;

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  bool isLoading = false;
  TextEditingController kodeProdukController = TextEditingController();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();

  void updateProduk() {
    kodeProdukController.text = widget.produk.kode_produk!;
    namaProdukController.text = widget.produk.nama_produk!;
    hargaProdukController.text = widget.produk.harga.toString();
    setState(() {});
  }

  @override
  void initState() {
    updateProduk();
    super.initState();
  }

  void _updateSubmit() {
    setState(() {
      isLoading = true;
    });

    ProdukBloc.updateProduk(widget.produk.id ?? 0, kodeProdukController.text,
            namaProdukController.text, hargaProdukController.text)
        .then((value) {
      if (value == true) {
        showDialog(
          context: context,
          builder: (context) => GeneralDialog(
              title: "SUKSES",
              titleColor: Colors.green,
              desc: 'Berhasil Update Produk',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProdukPage(),
                    ));
              }),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => GeneralDialog(
              title: "GAGAL",
              titleColor: Colors.green,
              desc: 'Gagal Update Produk',
              onPressed: () {
                Navigator.pop(context);
              }),
        );
      }
    });

    setState(() {
      isLoading = false;
    });
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
              hintText: widget.produk.kode_produk,
              // initialValue: kodeProdukController.text,
              label: "Kode Produk",
            ),
            // _namaProdukField
            GeneralTextField(
              controller: namaProdukController,
              hintText: widget.produk.nama_produk,
              // initialValue: namaProdukController.text,
              label: "Nama Produk",
            ),
            // _hargaProdukField
            GeneralTextField(
              controller: hargaProdukController,
              hintText: widget.produk.harga.toString(),
              // initialValue: hargaProdukController.text,
              label: "Harga Produk",
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (!isLoading) _updateSubmit();
                },
                child: Text("Ubah"))
          ],
        ),
      ),
    );
  }
}
