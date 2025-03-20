import 'package:flutter/material.dart';
import 'package:horoscopeapp/headnavbar.dart';
import 'package:horoscopeapp/dailyhoroscope.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
        child: Column(
          children: [
            Text(
              'เลือกการทำนาย',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Option 1: ไปหาทำนายราศี
                InkWell(
                  onTap: () {
                    Headnavbar.of(context)?.changeTab(1);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/homepage/zodiac.png', // Placeholder image
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('ทำนายราศี'),
                    ],
                  ),
                ),
                // Option 2: Daily Horoscope
                InkWell(
                  onTap: () {
                    Headnavbar.of(context)?.changeTab(2);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/homepage/daily.jpg', // เปลี่ยน Path ให้ถูกต้อง
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('ดูดวงวันนี้'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
