import 'package:flutter/material.dart';
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
            ),
            // _passwordField
            GeneralTextField(
              controller: passwordController,
              label: "Password",
            ),
            SizedBox(
              height: 30,
            ),
            // Button Registrasi
            ElevatedButton(onPressed: () {}, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
