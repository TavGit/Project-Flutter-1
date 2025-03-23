import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/Home/Home_Pages.dart';
import 'package:aplikasi_sederhana/Pages/chat_pages.dart';
import 'package:aplikasi_sederhana/Pages/incre-decre_pages.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int bottomNavbarIndex = 0;

  final List<Widget> _pages = [MyHome(), MyChat(), MyIncreDecre()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: bottomNavbarIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavbarIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Appcolor.activeColor,
          fontSize: 18,
        ),
        selectedItemColor: Appcolor.activeColor,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontSize: 18),
        onTap: (index) {
          setState(() {
            bottomNavbarIndex = index;
          });
        },
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon
            (Icons.home_outlined, 
            color: Appcolor.unActiveColor,
            ),
            activeIcon: Icon(Icons.home, color: Appcolor.activeColor),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_sharp,
              color: Appcolor.unActiveColor, 
            ),
            activeIcon: Icon(Icons.chat_sharp, color: Appcolor.activeColor),
            label: "Chat",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.analytics_outlined, color: Appcolor.unActiveColor),
          //   activeIcon: Icon(Icons.analytics, color: Appcolor.activeColor),
          //   label: "Grid",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate, color: Appcolor.unActiveColor),
            activeIcon: Icon(Icons.calculate, color: Appcolor.activeColor),
            label: "IncreDecre",
          ),
        ],
      ),
    );
  }
}

class Appcolor {
  static Color activeColor = Colors.amberAccent[700]!;
  static Color unActiveColor = Colors.white;
  static Color brokenWhite = Colors.white;
}
