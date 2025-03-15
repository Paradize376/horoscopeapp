import 'package:flutter/material.dart';

class ZodiacPredictionPage extends StatefulWidget {
  const ZodiacPredictionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ZodiacPredictionPageState createState() => _ZodiacPredictionPageState();
}

class _ZodiacPredictionPageState extends State<ZodiacPredictionPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int? _day;
  int? _month;
  int? _year;
  int? _hour;
  int? _minute;
  int _selectedIndex = 0;

  // ฟังก์ชันสำหรับสร้าง DropdownButton ที่มีพื้นหลัง
  Widget buildDropdownButton({
    required String hintText,
    required int? value,
    required List<DropdownMenuItem<int>> items,
    required void Function(int?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<int>(
        hint: Text(hintText),
        value: value,
        items: items,
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox(), // กำจัดเส้นขีดใต้
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // สามารถนำไปเพิ่มการนำทางหรือฟังก์ชันอื่นๆ ตาม index ที่เลือกได้
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ทำนายราศี', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF5A3E9D),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // กล่อง Container ที่ห่อ Form โดยไม่รวมปุ่ม ElevatedButton
            Container(
              width: 350,
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF9BCDDF),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name Input
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'ชื่อ',
                        filled: true,
                        fillColor: Colors.amber[100],
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกชื่อของคุณ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Date Input
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('วัน/เดือน/ปี'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: buildDropdownButton(
                            hintText: 'วัน',
                            value: _day,
                            items: List.generate(31, (index) => index + 1)
                                .map((day) => DropdownMenuItem(
                                      value: day,
                                      child: Text(day.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _day = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildDropdownButton(
                            hintText: 'เดือน',
                            value: _month,
                            items: List.generate(12, (index) => index + 1)
                                .map((month) => DropdownMenuItem(
                                      value: month,
                                      child: Text(month.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _month = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildDropdownButton(
                            hintText: 'ปี',
                            value: _year,
                            items: List.generate(
                                    100, (index) => DateTime.now().year - index)
                                .map((year) => DropdownMenuItem(
                                      value: year,
                                      child: Text(year.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _year = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Time Input
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('เวลาเกิด'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: buildDropdownButton(
                            hintText: 'ชั่วโมง',
                            value: _hour,
                            items: List.generate(24, (index) => index)
                                .map((hour) => DropdownMenuItem(
                                      value: hour,
                                      child: Text(hour.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _hour = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: buildDropdownButton(
                            hintText: 'นาที',
                            value: _minute,
                            items: List.generate(60, (index) => index)
                                .map((minute) => DropdownMenuItem(
                                      value: minute,
                                      child: Text(minute.toString()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _minute = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // ปุ่ม ElevatedButton วางนอกกล่อง Container และจัดให้อยู่ฝั่งขวาสุด
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 60.0), // ปรับค่า padding ตามที่ต้องการ
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('ทำนาย'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(189, 218, 170, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Footer โดยใช้ BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF5A3E9D),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.white),
            label: 'ราศี',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye, color: Colors.white),
            label: 'ดูดวงรายวัน',
          ),
        ],
      ),
    );
  }
}