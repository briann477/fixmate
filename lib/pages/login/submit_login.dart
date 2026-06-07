import 'package:flutter/material.dart';
import 'tombol_login.dart';

class SubmitLogin extends StatelessWidget {
  const SubmitLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TombolLogin(
      teks: 'Login',
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login berhasil')));

        // Nanti kalau MainPage sudah dibuat, bagian ini baru kita arahkan ke halaman utama.
      },
    );
  }
}
