import 'package:aplikasi_sederhana/Authentication/auth_service.dart';
import 'package:aplikasi_sederhana/Daftar/daftar_pages.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isObscure = true;

  // dapatkan authentikasi dari service
  final authService = AuthService();

  // buat variabel controller untuk email dan pasword
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // fungsi untuk login
  void login() async {
    // persiapkan data
    final email = _emailController.text;
    final password = _passwordController.text;

    // mencoba login
    try {
      await authService.signInWithEmailPassword(email, password);
    }

    // jika error
    catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Gagal Login")));
        print('error: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Login Kuyy ',
          style: TextStyle(
            fontFamily: 'SpicyRice-Regular',
            fontSize: 50,
            color: Color.fromARGB(255, 7, 255, 48),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 230, top: 30),
              child: Text(
                'Masukkan Email: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _emailController,
                autocorrect: false,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 82, 255, 203),
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 82, 255, 203),
                      width: 2.0,
                    ),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                  // ),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Color.fromARGB(255, 82, 255, 203),
                  hintText: 'Masukkan Email',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 10),
              child: Text(
                'Masukkan  Password: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _passwordController,
                autocorrect: false,
                autofocus: false,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 58, 91, 183),
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 58, 91, 183),
                      width: 2.0,
                    ),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(
                  //     color: Colors.deepPurple,
                  //     width: 4.0,
                  //   ),
                  // ),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Color.fromARGB(255, 58, 91, 183),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  suffixIconColor: Color.fromARGB(255, 58, 91, 183),
                  hintText: 'Masukkan Password',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500, 50),
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Login 👉',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyDaftar(),
                ),
              ),
              child: Center(
                child: Text(
                  "Belum punya akun?, Let's Go Sign Up!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
