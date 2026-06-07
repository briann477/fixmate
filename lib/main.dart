import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';

void main() {
  runApp(const FixMateApp());
}

class FixMateApp extends StatelessWidget {
  const FixMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
