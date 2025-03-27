import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aplikasi_sederhana/Authentication/auth_gate.dart';
// import 'package:aplikasi_sederhana/Daftar/daftar_pages.dart';
// import 'package:aplikasi_sederhana/Login/login_pages.dart';
// import 'package:aplikasi_sederhana/Home/Home_Pages.dart';
// import './BottomNavBar/bottomnavbar.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttcnVxcmhwcGxzbW1hY2RqdWtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwNTA2NDIsImV4cCI6MjA1ODYyNjY0Mn0.7XOVtt_NJKRG2bQCnOomlMtbIGmYiwaJfo4U-mZhmj0",
    url: "https://kmruqrhpplsmmacdjukj.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}