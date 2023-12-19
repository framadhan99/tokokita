import 'package:flutter/material.dart';
import 'package:tokokita/ui/page/produk/produk_form_page.dart';
import 'package:tokokita/ui/page/login_page.dart';
import 'package:tokokita/ui/page/produk/produk_page.dart';
import 'package:tokokita/ui/page/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const RegistrasiPage(),
    );
  }
}
