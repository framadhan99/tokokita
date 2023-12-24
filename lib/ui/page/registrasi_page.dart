import 'package:flutter/material.dart';
import 'package:tokokita/bloc/registrasi_bloc.dart';
import 'package:tokokita/model/registrasi.dart';
import 'package:tokokita/ui/widget/general_dialog.dart';
import 'package:tokokita/ui/widget/general_textfield.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  TextEditingController namaTextboxController = TextEditingController();
  TextEditingController emailTextboxController = TextEditingController();
  TextEditingController passwordTextboxController = TextEditingController();
  TextEditingController konfirmasiPasswordTextboxController =
      TextEditingController();
  bool _isLoading = false;
  Registrasi? registrasi;

  @override
  Widget build(BuildContext context) {
    void _submit() {
      setState(() {
        _isLoading = true;
      });
      RegistrasiBloc.registrasi(
        name: namaTextboxController.text,
        email: emailTextboxController.text,
        password: passwordTextboxController.text,
        context: context,
      );

      setState(() {
        _isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // _namaTextField
            GeneralTextField(
              controller: namaTextboxController,
              label: "Nama",
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value != null && value.isNotEmpty && value.length < 3) {
                  return "Nama harus di isi minimal 3 karakter";
                } else {
                  return null;
                }
              },
            ),
            // _emailTextField
            GeneralTextField(
              controller: emailTextboxController,
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                Pattern pattern =
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                RegExp regex = RegExp(pattern.toString());
                if (value != null &&
                    value.isNotEmpty &&
                    !regex.hasMatch(value)) {
                  return "Email tidak valid";
                }
                return null;
              },
            ),
            // _passwordField
            GeneralTextField(
              controller: passwordTextboxController,
              label: "Password",
              obscureText: true,
              validator: (String? value) {
                if (value != null && value.isNotEmpty && value.length < 6) {
                  return "Password harus di isi minimal 6 karakter";
                }
                return null;
              },
            ),
            // _konfirmasipasswordField
            GeneralTextField(
              controller: konfirmasiPasswordTextboxController,
              label: "Konfirmasi Password",
              obscureText: true,
              validator: (String? value) {
                if (value != passwordTextboxController.text) {
                  return "Konfirmasi password tidak sama";
                }
                return null;
              },
            ),
            // vertical space
            SizedBox(
              height: 30,
            ),
            // Button Registrasi
            ElevatedButton(
                onPressed: () {
                  if (!_isLoading) _submit();
                  print("");
                },
                child: Text("Registrasi"))
          ],
        ),
      ),
    );
  }
}
