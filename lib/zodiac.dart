// import 'package:flutter/material.dart';

// class Zodiac extends StatefulWidget {
//   const Zodiac({super.key});

//   @override
//   _ZodiacState createState() => _ZodiacState();
// }

// class _ZodiacState extends State<Zodiac> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   int? _day;
//   int? _month;
//   int? _year;
//   int? _hour;
//   int? _minute;

//   // ฟังก์ชันสำหรับสร้าง DropdownButton
//   Widget buildDropdownButton({
//     required String hintText,
//     required int? value,
//     required List<DropdownMenuItem<int>> items,
//     required void Function(int?) onChanged,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: DropdownButton<int>(
//         hint: Text(hintText),
//         value: value,
//         items: items,
//         onChanged: onChanged,
//         isExpanded: true,
//         underline: const SizedBox(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center( // ใช้ Center เพราะมันแสดงใน Heardnavbar (ไม่มี Scaffold)
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 350,
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: const Color(0xFF9BCDDF),
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Name Input
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'ชื่อ',
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         _name = value;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'กรุณากรอกชื่อของคุณ';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Date Input
//                   const Align(alignment: Alignment.centerLeft, child: Text('วัน/เดือน/ปี')),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: buildDropdownButton(
//                           hintText: 'วัน',
//                           value: _day,
//                           items: List.generate(31, (index) => index + 1)
//                               .map((day) => DropdownMenuItem(value: day, child: Text(day.toString())))
//                               .toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _day = value;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: buildDropdownButton(
//                           hintText: 'เดือน',
//                           value: _month,
//                           items: List.generate(12, (index) => index + 1)
//                               .map((month) => DropdownMenuItem(value: month, child: Text(month.toString())))
//                               .toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _month = value;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: buildDropdownButton(
//                           hintText: 'ปี',
//                           value: _year,
//                           items: List.generate(100, (index) => DateTime.now().year - index)
//                               .map((year) => DropdownMenuItem(value: year, child: Text(year.toString())))
//                               .toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _year = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),

//                   // Time Input
//                   const Align(alignment: Alignment.centerLeft, child: Text('เวลาเกิด')),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: buildDropdownButton(
//                           hintText: 'ชั่วโมง',
//                           value: _hour,
//                           items: List.generate(24, (index) => index)
//                               .map((hour) => DropdownMenuItem(value: hour, child: Text(hour.toString())))
//                               .toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _hour = value;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: buildDropdownButton(
//                           hintText: 'นาที',
//                           value: _minute,
//                           items: List.generate(60, (index) => index)
//                               .map((minute) => DropdownMenuItem(value: minute, child: Text(minute.toString())))
//                               .toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _minute = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),

//           // "ทำนาย" Button
//           Padding(
//             padding: const EdgeInsets.only(right: 60.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (_day == null || _month == null || _year == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('กรุณาเลือกวัน/เดือน/ปีเกิด')),
//                     );
//                     return;
//                   }
//                   if (_hour == null || _minute == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('กรุณาเลือกเวลาเกิด')),
//                     );
//                     return;
//                   }

//                   // แสดงผลว่าได้รับข้อมูลอะไรบ้าง
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('กำลังทำนายให้ $_name')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromRGBO(189, 218, 170, 1),
//               ),
//               child: const Text('ทำนาย'), 
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
