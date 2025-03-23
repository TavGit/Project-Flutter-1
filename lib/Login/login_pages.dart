import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/BottomNavBar/bottomnavbar.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      // backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                'Login Kuyy ',
                style: TextStyle(
                  fontFamily: 'SpicyRice-Regular',
                  fontSize: 50,
                  color: Color.fromARGB(255, 7, 255, 48),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 30),
              child: Text(
                'Masukkan Username: ',
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
                autocorrect: false,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 82, 255, 203), width: 4.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 82, 255, 203), width: 2.0),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                  // ),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 82, 255, 203),
                  hintText: 'Masukkan Username',
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyBottomNavBar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500, 50),
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Gass Login 👉',
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
