import 'package:aplikasi_sederhana/BottomNavBar/bottomnavbar.dart';
// import 'package:aplikasi_sederhana/Home/Home_Pages.dart';
import 'package:aplikasi_sederhana/Login/login_pages.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return MyBottomNavBar();
        } else {
          return MyLogin();
        }
      },
    );
  }
}
