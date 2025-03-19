import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PredictionResultPage extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onBack;

  const PredictionResultPage({
    super.key,
    required this.data,
    required this.onBack,
  });

  String _getZodiacSubtitle(String sign) {
    const subtitles = {
      'ราศีเมษ': 'ราศีแห่งความจริงใจแล่นคบ',
      'ราศีพฤษภ': 'ราศีแห่งความมั่นคง',
      'ราศีเมถุน': 'ราศีแห่งการสื่อสาร',
      'ราศีกรกฎ': 'ราศีแห่งครอบครัว',
      'ราศีสิงห์': 'ราศีแห่งความสำเร็จ',
      'ราศีกันย์': 'ราศีแห่งสุขภาพ',
      'ราศีตุลย์': 'ราศีแห่งความสมดุล',
      'ราศีพิจิก': 'ราศีแห่งการเปลี่ยนแปลง',
      'ราศีธนู': 'ราศีแห่งการเดินทาง',
      'ราศีมังกร': 'ราศีแห่งอาชีพการงาน',
      'ราศีกุมภ์': 'ราศีแห่งความคิดสร้างสรรค์',
      'ราศีมีน': 'ราศีแห่งสัญชาตญาณ',
    };
    return subtitles[sign] ?? 'คำอธิบายราศี';
  }

  String _getZodiacImage(String sign) {
    const images = {
      'ราศีเมษ': 'assets/zodiacimages/aries.png',
      'ราศีพฤษภ': 'assets/zodiacimages/taurus.png',
      'ราศีเมถุน': 'assets/zodiacimages/gemini.png',
      'ราศีกรกฎ': 'assets/zodiacimages/cancer.png',
      'ราศีสิงห์': 'assets/zodiacimages/leo.png',
      'ราศีกันย์': 'assets/zodiacimages/virgo.png',
      'ราศีตุลย์': 'assets/zodiacimages/libra.png',
      'ราศีพิจิก': 'assets/zodiacimages/scorpio.png',
      'ราศีธนู': 'assets/zodiacimages/sagittarius.png',
      'ราศีมังกร': 'assets/zodiacimages/capricorn.png',
      'ราศีกุมภ์': 'assets/zodiacimages/aquarius.png',
      'ราศีมีน': 'assets/zodiacimages/pisces.png',
    };
    return images[sign] ?? 'assets/default.png';
  }

  @override
  Widget build(BuildContext context) {
    final date = data['date'] as DateTime;
    final time = data['time'] as TimeOfDay;
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);
    final formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    final zodiacSign = data['zodiacSign'] as String;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconButton(
            //   icon: const Icon(Icons.arrow_back),
            //   onPressed: onBack,
            //   color: Colors.grey[700],
            // ),
            Card(
              color: Colors.amber[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ: ${data['name']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'วันเกิด: $formattedDate',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'เวลาเกิด: $formattedTime',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              zodiacSign,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B1F86),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getZodiacSubtitle(zodiacSign),
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                _getZodiacImage(zodiacSign),
                height: 300,
                errorBuilder:
                    (_, __, ___) => const Icon(Icons.error_outline, size: 100),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFBBDEFB),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                data['predictionText'],
                style: const TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
