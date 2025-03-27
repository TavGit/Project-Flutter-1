import 'package:aplikasi_sederhana/Authentication/auth_service.dart';
import 'package:flutter/material.dart';
// import 'package:aplikasi_sederhana/Login/login_pages.dart';
import 'package:gotrue/src/types/auth_response.dart';

class MyDaftar extends StatefulWidget {
  const MyDaftar({super.key});

  @override
  State<MyDaftar> createState() => _MyDaftarState();
}

class _MyDaftarState extends State<MyDaftar> {
  bool _isObscure = true;

  // dapatkan auth service
  final authService = AuthService();

  // buat teks controller untuk email dan password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  // fungsi untuk daftar
  void signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmpasswordController.text.trim();

    print('Password: $password');

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi password tidak cocok')),
      );
      return;
    }

    // Validasi panjang password
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password harus 6 karakter atau lebih')),
      );
      return;
    }

    try {
      final response = await authService.signUp(email, password);
      if (response.error == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registrasi berhasil')));
        // Navigasi ke halaman berikutnya
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.error!.message}')),
        );
      }

      print('response: $response'); 

      
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, silahkan coba lagi')),
      );
      print('kesalahan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Sign Up Kuyy ',
          style: TextStyle(
            fontFamily: 'SpicyRice-Regular',
            fontSize: 50,
            color: Colors.amber,
          ),
        ),
      ),
      
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 230, top: 10),
              child: Text(
                'Buat Email: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                      color: Color.fromARGB(255, 255, 252, 82),
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 252, 82),
                      width: 2.0,
                    ),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                  // ),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Color.fromARGB(255, 255, 252, 82),
                  hintText: 'Buat Email',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 10),
              child: Text(
                'Buat Password: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                      color: Colors.deepPurple,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
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
                  prefixIconColor: Colors.deepPurple,
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
                  suffixIconColor: Colors.deepPurple,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 10),
              child: Text(
                'Konfirmasi Password: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _confirmpasswordController,
                autocorrect: false,
                autofocus: false,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
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
                  prefixIconColor: Colors.deepPurple,
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
                  suffixIconColor: Colors.deepPurple,
                  hintText: 'Konfirmasi Password',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500, 50),
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Sign Up 👉',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}
