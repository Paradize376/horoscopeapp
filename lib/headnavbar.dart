import 'package:flutter/material.dart';
import 'zodiac_prediction_page.dart';
import 'result_prediction_page.dart';
import 'homepage.dart';

class Headnavbar extends StatefulWidget {
  const Headnavbar({super.key});

  @override
  State<Headnavbar> createState() => _HeadnavbarState();

  // ฟังก์ชันให้หน้าอื่นเรียก changeTab() ได้
  // ignore: library_private_types_in_public_api
  static _HeadnavbarState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HeadnavbarState>();
  }
}

class _HeadnavbarState extends State<Headnavbar> {
  int _selectedIndex = 0;
  Map<String, dynamic>? _predictionData;

  // ชื่อหัวข้อของแต่ละหน้า
  final List<String> _titles = ['หน้าหลัก', 'ทำนายราศี', 'ดูดวงรายวัน'];
  // final List<Widget> _baseScreens = [
  //   Homepage(),
  //   ZodiacPredictionPage(),
  //   // DailyHoroscopePage(),
  // ];

  // เพิ่มเมธอดแสดงผลลัพธ์ในแท็บเดิม
  // void showPredictionResult(Map<String, dynamic> data) {
  //   setState(() {
  //     _predictionData = data;
  //   });
  // }

  // รายการหน้าที่จะสลับ
  final List<Widget> _screens = [
    Homepage(),
    ZodiacPredictionPage(),
    // DailyHoroscopePage(), // เพิ่มหน้า ดูดวงรายวัน
  ];

  // void handlePredictionResult(Map<String, dynamic> data) {
  //   setState(() {
  //     _predictionData = data;
  //     _selectedIndex = 2;
  //   });
  // }

  // ฟังก์ชันเปลี่ยนแท็บ
  void changeTab(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
    // if (index == 2 && _predictionData == null) return;
    // setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3B1F86),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: SafeArea(
        child: _screens[_selectedIndex],
      ), // ป้องกัน UI ชนกับ Status Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: changeTab, // เปลี่ยนหน้าเมื่อกดปุ่ม
        backgroundColor: const Color(0xFF3B1F86),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'ทำนายราศี'),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'ดูดวงรายวัน',
          ),
        ],
      ),
    );
  }
}
