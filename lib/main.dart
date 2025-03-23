import 'package:flutter/material.dart';
// import 'package:aplikasi_sederhana/Daftar/daftar_pages.dart';
// import 'package:aplikasi_sederhana/Login/login_pages.dart';
// import 'package:aplikasi_sederhana/Home/Home_Pages.dart';
import './BottomNavBar/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
    );
  }
}


