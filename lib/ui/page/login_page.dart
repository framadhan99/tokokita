import 'package:flutter/material.dart';
import 'package:tokokita/bloc/login_bloc.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/page/produk/produk_page.dart';
import 'package:tokokita/ui/page/registrasi_page.dart';
import 'package:tokokita/ui/widget/general_dialog.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void _submit() {
    setState(() {
      isLoading = true;
    });
    LoginBloc.login(
            email: emailTextController.text, password: passwordController.text)
        .then((value) async {
      await UserInfo().setToken(value!.data!.token!);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return ProdukPage();
        },
      ));
    }, onError: (error) {
      showDialog(
        context: context,
        builder: (context) => GeneralDialog(
            title: "GAGAL",
            titleColor: Colors.red,
            desc: "Login gagal silahkan coba lagi",
            onPressed: () {
              Navigator.pop(context);
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrasiPage(),
                      ));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
