import 'package:flutter/material.dart';
import 'package:horoscopeapp/zodiac_prediction_page.dart';
import 'homepage.dart';


class Headnavbar extends StatefulWidget {
  const Headnavbar({super.key});

  @override
  State<Headnavbar> createState() => _HeadnavbarState();

  // ฟังก์ชันให้หน้าอื่นเรียก changeTab() ได้
  static _HeadnavbarState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HeadnavbarState>();
  }
}

class _HeadnavbarState extends State<Headnavbar> {
  int _selectedIndex = 0;

  // ชื่อหัวข้อของแต่ละหน้า
  final List<String> _titles = ['หน้าหลัก', 'ทำนายราศี', 'ดูดวงรายวัน'];

  // รายการหน้าที่จะสลับ
  final List<Widget> _screens = [
    Homepage(),
    ZodiacPredictionPage(),
    // DailyHoroscopePage(), // เพิ่มหน้า ดูดวงรายวัน
  ];

  // ฟังก์ชันเปลี่ยนแท็บ
  void changeTab(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => changeTab(0), // กลับไปหน้าแรก
              ),
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3B1F86),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: SafeArea(child: _screens[_selectedIndex]), // ป้องกัน UI ชนกับ Status Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: changeTab, // เปลี่ยนหน้าเมื่อกดปุ่ม
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
