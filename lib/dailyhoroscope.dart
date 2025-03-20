import 'dart:math';
import 'package:flutter/material.dart';

// คลาสเก็บข้อมูลคำทำนายของแต่ละวัน
class DailyHoroscope {
  final String career; // การงาน
  final String finance; // การเงิน
  final String love; // ความรัก

  DailyHoroscope({required this.career, required this.finance, required this.love});
}

// Dataset คำทำนายที่สามารถสุ่มได้
final List<DailyHoroscope> horoscopePool = [
  DailyHoroscope(career: "มีโอกาสได้รับโปรเจคใหม่ แต่ต้องระวังความล่าช้า", finance: "รายจ่ายเยอะกว่าปกติ ควรวางแผนดีๆ", love: "คนโสดมีโอกาสพบคนถูกใจในที่ทำงาน"),
  DailyHoroscope(career: "งานราบรื่น ผู้ใหญ่ให้การสนับสนุน", finance: "รายรับรายจ่ายสมดุล ควรออมเพิ่ม", love: "คนโสดอาจมีคนใกล้ตัวแอบชอบ"),
  DailyHoroscope(career: "มีไอเดียใหม่ๆ ในงาน แต่ควรหาข้อมูลเพิ่มก่อนลงมือ", finance: "รายจ่ายไม่เยอะ แต่ควรเก็บออมให้มากขึ้น", love: "คนรักอาจต้องการกำลังใจจากคุณ"),
  DailyHoroscope(career: "ระวังความขัดแย้งในที่ทำงาน", finance: "มีโชคด้านการเงิน", love: "คนรักต้องการกำลังใจจากคุณ"),
  DailyHoroscope(career: "อาจต้องรับผิดชอบงานเพิ่มขึ้น แต่ส่งผลดีในระยะยาว", finance: "มีโอกาสได้รับของขวัญจากคนใกล้ตัว", love: "คู่รักควรปรับความเข้าใจกันมากขึ้น"),
  DailyHoroscope(career: "มีโอกาสก้าวหน้าด้านงาน แต่ต้องอดทนรอจังหวะ", finance: "รายจ่ายเกี่ยวกับสุขภาพหรือยานพาหนะ", love: "คนโสดอาจพบรักผ่านโซเชียลมีเดีย"),
  DailyHoroscope(career: "งานเข้มข้น ต้องมีสมาธิให้มาก", finance: "รายรับคงที่แต่มีแผนใช้เงินที่ดีขึ้น", love: "คู่รักควรให้เวลากันมากขึ้น"),
];

// ฟังก์ชันสุ่มคำทำนาย
DailyHoroscope getRandomHoroscope() {
  final random = Random();
  return horoscopePool[random.nextInt(horoscopePool.length)];
}

class DailyHoroscopePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text("ดูดวงวันนี้", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("สุ่มดวงวันนี้", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: List.generate(days.length, (index) {
                  return buildDayButton(context, days[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDayButton(BuildContext context, DayInfo day) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // เปิดหน้าคำทำนายแบบสุ่มเมื่อกดปุ่มวัน
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HoroscopeDetailPage(day: day.name, dayColor: day.color),
              ),
            );
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: day.color.withOpacity(0.2),
              border: Border.all(color: day.color, width: 3),
            ),
            child: Center(
              child: Text(
                day.shortName,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: day.color),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(day.name, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

// หน้าแสดงคำทำนายที่สุ่มขึ้นมา
class HoroscopeDetailPage extends StatelessWidget {
  final String day;
  final Color dayColor;

  HoroscopeDetailPage({required this.day, required this.dayColor});

  @override
  Widget build(BuildContext context) {
    // สุ่มคำทำนายใหม่ทุกครั้งที่เปิด
    final DailyHoroscope horoscope = getRandomHoroscope();

    return Scaffold(
      backgroundColor: Colors.grey[200], // สีพื้นหลังอ่อนๆ
      appBar: AppBar(
        backgroundColor: dayColor,
        title: Text("ดูดวงวัน $day", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ไอคอนปฏิทินที่แสดงวัน
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: dayColor.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: dayColor, width: 3),
              ),
              child: Icon(Icons.calendar_today, size: 80, color: dayColor),
            ),
            SizedBox(height: 16),

            // Card แสดงคำทำนาย
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("💼 การงาน", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: dayColor)),
                    SizedBox(height: 5),
                    Text(horoscope.career, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 16),

                    Text("💰 การเงิน", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: dayColor)),
                    SizedBox(height: 5),
                    Text(horoscope.finance, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 16),

                    Text("❤️ ความรัก", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: dayColor)),
                    SizedBox(height: 5),
                    Text(horoscope.love, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ข้อมูลของวันต่าง ๆ
class DayInfo {
  final String name;
  final String shortName;
  final Color color;

  DayInfo({required this.name, required this.shortName, required this.color});
}

final List<DayInfo> days = [
  DayInfo(name: "อาทิตย์", shortName: "อา", color: Colors.red),
  DayInfo(name: "จันทร์", shortName: "จ", color: Colors.yellow),
  DayInfo(name: "อังคาร", shortName: "อ", color: Colors.pink),
  DayInfo(name: "พุธ", shortName: "พ", color: Colors.green),
  DayInfo(name: "พฤหัสบดี", shortName: "พฤ", color: Colors.orange),
  DayInfo(name: "ศุกร์", shortName: "ศ", color: Colors.blue),
  DayInfo(name: "เสาร์", shortName: "ส", color: Colors.purple),
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DailyHoroscopePage(),
  ));
}
