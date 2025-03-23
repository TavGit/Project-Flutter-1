import 'package:flutter/material.dart';

class MyIncreDecre extends StatefulWidget {
  const MyIncreDecre({super.key});

  @override
  State<MyIncreDecre> createState() => _MyIncreDecreState();
}

class _MyIncreDecreState extends State<MyIncreDecre> {
  int artimatika = 0;

  void _incrementCounter() {
    setState(() {
      ++artimatika;
    });
  }

  void _decrementCounter() {
    setState(() {
      --artimatika;
    });
  }

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
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              '$artimatika',
              style: TextStyle(fontSize: 70),
            )
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget> [
          Align(
            alignment: Alignment(0.7, 0.6),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.6),
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
