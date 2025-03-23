
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
















