import 'package:flutter/material.dart';

import 'Getting_Started.dart';
import 'Login/Login.dart';
import 'Register/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Getting_Started(),
    );
  }
}
