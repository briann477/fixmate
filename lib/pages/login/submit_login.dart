import 'package:flutter/material.dart';
import '../main_page.dart';
import 'tombol_login.dart';

class SubmitLogin extends StatelessWidget {
  const SubmitLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TombolLogin(
      teks: 'Login',
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
    );
  }
}
