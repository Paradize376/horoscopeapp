import 'package:flutter/material.dart';
import 'package:horoscopeapp/zodiac_prediction_page.dart';
import 'homepage.dart';

class Headnavbar extends StatefulWidget {
  const Headnavbar({super.key});

  @override
  State<Headnavbar> createState() => _HeadnavbarState();

  // ให้ Homepage ใช้ changeTab()
  static _HeadnavbarState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HeadnavbarState>();
  }
}

class _HeadnavbarState extends State<Headnavbar> {
  int _selectedIndex = 0; // เก็บค่าหน้าปัจจุบัน

  final List<String> _titles = ['หน้าหลัก', 'ทำนายราศี', 'ดูดวงรายวัน'];

  final List<Widget> _screens = [
    Homepage(),
    ZodiacPredictionPage(),
    // DailyHoroscopePage(),
  ];

  // ฟังก์ชันเปลี่ยนแท็บ
  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        backgroundColor: const Color(0xFF3B1F86),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: changeTab, // ใช้ changeTab() เพื่อเปลี่ยนหน้า
        backgroundColor: const Color(0xFF3B1F86),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'ทำนายราศี'),
          BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye), label: 'ดูดวงรายวัน'),
        ],
      ),
    );
  }
}
