
import 'package:aplikasi_sederhana/Authentication/auth_service.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final authService = AuthService();
 

  void logout() async {
    await authService.signOut();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout)),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SpicyRice-Regular',
                fontSize: 40,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(
              'Selamat Datang di Home 👏',
              style: TextStyle(
                fontFamily: 'SpicyRice-Regular',
                fontSize: 30,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ) ,     
    );
  }
}
















