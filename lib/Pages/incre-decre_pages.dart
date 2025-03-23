import 'package:flutter/material.dart';

class MyIncreDecre extends StatefulWidget {
  const MyIncreDecre({super.key});

  @override
  State<MyIncreDecre> createState() => _MyIncreDecreState();
}

class _MyIncreDecreState extends State<MyIncreDecre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Incre & Decre Pages',
              style: TextStyle(
                fontFamily: 'SpicyRice-Regular',
                fontSize: 30,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}