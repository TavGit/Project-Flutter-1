import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/Login/login_pages.dart';


class MyDaftar extends StatefulWidget {
  const MyDaftar({super.key});

  @override
  State<MyDaftar> createState() => _MyDaftarState();
}

class _MyDaftarState extends State<MyDaftar> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      // backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                'Daftar Akun',
                style: TextStyle(
                  fontFamily: 'SpicyRice-Regular',
                  fontSize: 50,
                  color: Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 30),
              child: Text(
                'Buat Username: ',
                style: TextStyle(fontSize: 16, color: Colors.white ,fontWeight: FontWeight.bold),
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
                    borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(color: Colors.redAccent, width: 4.0),
                  // ),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.redAccent,
                  hintText: 'Buat Username',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 230, top: 10),
              child: Text(
                'Buat Password: ',
                style: TextStyle(fontSize: 16, color: Colors.white ,fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(500, 50),
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Gass Daftar 👉',
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
