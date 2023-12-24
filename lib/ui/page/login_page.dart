import 'package:flutter/material.dart';
import 'package:tokokita/ui/page/produk/produk_page.dart';
import 'package:tokokita/ui/page/registrasi_page.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // _emailTextField
            GeneralTextField(
              controller: emailTextController,
              label: "Email",
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return "Email harus di isi";
                }
                return null;
              },
            ),
            // _passwordField
            GeneralTextField(
              controller: passwordController,
              label: "Password",
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return "Password harus di isi";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            // Button Registrasi
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdukPage(),
                      ));
                },
                child: Text("Login")),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RegistrasiPage(),
                  //     ));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
