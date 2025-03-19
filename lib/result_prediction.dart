import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('คำทำนายราศี'),
          backgroundColor: Color(0xFF6A1B9A), // สีม่วง
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ราศีเมษ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('ราศีแห่งความจริงใจแล่นคบ', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Center(child: Image.asset('assets/aries.png', height: 100)),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFBBDEFB), // สีฟ้า
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'การเริ่มสร้างสรรค์สิ่งใหม่ แบ่งความคิดใหม่ๆ กิจกรรมเปลี่ยนแปลงเหมาะเป็นบวก ไม่ซบเซา',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home)),
                  BottomNavigationBarItem(icon: Icon(Icons.euro)),
                  BottomNavigationBarItem(icon: Icon(Icons.visibility)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
