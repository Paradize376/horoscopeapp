import 'package:flutter/material.dart';

class Heardnavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // รับ title เพื่อให้สามารถเปลี่ยน title ได้ตามแต่ละหน้า

  const Heardnavbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: '',
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF3B1F86), // สีพื้นหลังของ AppBar
          // ส่วนสำคัญ: shape + borderRadius
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15), // กำหนดความโค้งของขอบล่าง
            ),
          ),
        ),
      ),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
