import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'result_prediction_page.dart';

class ZodiacPredictionPage extends StatefulWidget {
  const ZodiacPredictionPage({super.key});

  @override
  _ZodiacPredictionPageState createState() => _ZodiacPredictionPageState();
}

class _ZodiacPredictionPageState extends State<ZodiacPredictionPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showResult = false;
  String _name = '';
  int? _day;
  int? _month;
  int? _year;
  int? _hour;
  int? _minute;
  List<int> _daysList = List.generate(31, (index) => index + 1);
  Map<String, dynamic>? _predictionData;

  void _updateDays() {
    if (_month != null && _year != null) {
      final lastDay = DateTime(_year!, _month! + 1, 0).day;
      _daysList = List.generate(lastDay, (index) => index + 1);
      if (_day != null && _day! > lastDay) {
        _day = null;
      }
    } else {
      _daysList = List.generate(31, (index) => index + 1);
    }
    setState(() {});
  }

  bool _isValidDate(int year, int month, int day) {
    try {
      DateTime(year, month, day);
      return true;
    } catch (e) {
      return false;
    }
  }

  String _calculateZodiacSign() {
    final month = _month!;
    final day = _day!;

    if ((month == 4 && day >= 13) || (month == 5 && day <= 13))
      return 'ราศีเมษ';
    if ((month == 5 && day >= 14) || (month == 6 && day <= 13))
      return 'ราศีพฤษภ';
    if ((month == 6 && day >= 14) || (month == 7 && day <= 14))
      return 'ราศีเมถุน';
    if ((month == 7 && day >= 15) || (month == 8 && day <= 16))
      return 'ราศีกรกฎ';
    if ((month == 8 && day >= 17) || (month == 9 && day <= 16))
      return 'ราศีสิงห์';
    if ((month == 9 && day >= 17) || (month == 10 && day <= 16))
      return 'ราศีกันย์';
    if ((month == 10 && day >= 17) || (month == 11 && day <= 15))
      return 'ราศีตุลย์';
    if ((month == 11 && day >= 16) || (month == 12 && day <= 15))
      return 'ราศีพิจิก';
    if ((month == 12 && day >= 16) || (month == 1 && day <= 13))
      return 'ราศีธนู';
    if ((month == 1 && day >= 14) || (month == 2 && day <= 12))
      return 'ราศีมังกร';
    if ((month == 2 && day >= 13) || (month == 3 && day <= 13))
      return 'ราศีกุมภ์';
    if ((month == 3 && day >= 14) || (month == 4 && day <= 12))
      return 'ราศีมีน';
    return 'ไม่ทราบราศี';
  }

  String _getPredictionText() {
    switch (_calculateZodiacSign()) {
      case 'ราศีเมษ':
        return 'การริเริ่มสร้างสรรค์สิ่งใหม่ แนวความคิดใหม่ๆ กิจการแปลกแหวกแนว เหมาะเป็นนักสู้ ไม่ยอมแพ้ ทหาร ข้าราชการ งานท้าทาย รักอิสระ ชอบการเดินทางและท่องเที่ยว';
      case 'ราศีพฤษภ':
        return 'การปฏิบัติที่หนักแน่นมั่นคง มีความพอใจในความเป็นอยู่ของตนเอง เป็นที่รักของคนทั่วไป เป็นคนรักสงบ เป็นนักหมุนเงิน ช่างศิลปะ ชอบมีชื่อเสียง โอ่อ่า ชอบสะสมทรัพย์สมบัติ เหมาะที่จะเป็นนักร้อง กสิกรรม นักก่อสร้าง และนักวิทยาศาสตร์';
      case 'ราศีเมถุน':
        return 'การไม่อยู่นิ่ง ประกอบด้วยสติปัญญา มักจะทำอะไรสองอย่างในเวลาเดียวกัน เหมาะที่จะเป็นนักกฎหมาย นักปรัชญา นักประดิษฐ์ นักคิด นักพูด ผู้แทนที่ชอบชีวิตหลายแบบ';
      case 'ราศีกรกฎ':
        return 'การหวั่นไหวในอารมณ์ ภายนอกมักจะแข็งแกร่งเพื่อปกปิดมิให้คนอื่นรู้ความในใจ เป็นคนระมัดระวังเหมือนมารดาปฏิบัติต่อบุตร มีความอดทนต่อความยากลำบากเสมอ เหมาะที่จะเป็นนักแสดง นาฏศิลป์ แพทย์ ตำรวจ อดทนเก่ง';
      case 'ราศีสิงห์':
        return 'กำลังอำนาจในสิ่งต่างๆ ความรุ่งโรจน์ ความเชื่อมั่น มีศรัทธาแรงกล้าและสามารถดึงดูดคนอื่นได้ เหมาะที่จะเป็นผู้นำ นักการเมือง หัวหน้า นักออกแบบ นักแต่งตัว นายหัว';
      case 'ราศีกันย์':
        return 'ความเฉลียวฉลาด ความสามารถ ความคล่องแคล่ว เป็นนักอุดมคติ มีพิธีรีตอง พิถีพิถัน เหมาะที่จะเป็นนักเขียน นักประพันธ์ นักแต่งเพลง นักโต้วาที ประชาสมพันธ์ นักหนังสือพิมพ์ ผู้แทนราษฎร นักบัญชี';
      case 'ราศีตุลย์':
        return 'การดำรงค์ไว้ซึ่งสันติภาพและความยุติธรรมทั้งหลาย เป็นผู้กระทำการรักษาความสอดคล้องต้องกันเพื่อประโยชน์ส่วนรวม เหมาะที่จะเป็นผู้พิพากษา นักร้องนักดนตรี และศิลปะอื่นๆ';
      case 'ราศีพิจิก':
        return 'การทำลายล้าง เป็นคนเจ้าคารม เหน็บแนม โทสะร้าย ขยันขันแข็ง มีความคิดสูงส่ง มีการพัฒนา กล้าเผชิญต่อสิ่งต่างๆ เหมาะที่จะเป็นนักปรัชญา นักสืบ ศัลยแพทย์ ครู และนักค้าของเก่า';
      case 'ราศีธนู':
        return 'ความคิดใหม่ๆ เป็นทูตนำความคิดเพื่อคนอื่น ชอบเดินทาง ชอบกีฬา ใช้สมองในด้านปรัชญาและหลักการต่างๆ เหมาะที่จะเป็นนักปราชญ์ ศาสตราจารย์ ที่ปรึกษา นักบวช ผู้พิพากษา แพทย์ นักแม่นปืนและนักโหราศาสตร์';
      case 'ราศีมังกร':
        return 'ความทรหดอดทน มักสามารถจัดตังองค์การ การบริหารฟันฝ่าไป อย่างไม่กลัวอันตราย เฉลียวฉลาดในการใช้ความรู้ เป็นผู้จัดการ ผู้ปกครองประเทศ นักการทูต นักอุตสาหกรรม กสิกรรม วิทยาศาสตร์ หนักเอาเบาสู้ ค้าพืชผลและของป่า';
      case 'ราศีกุมภ์':
        return 'มีความสามารถ ฉลาด หนักแน่น กล้าแข็ง เปิดเผยตรงไปตรงมา ให้ประโยชน์ต่อมิตรสหาย สังคม เหมาะที่จะเป็นนักค้นคว้า นักวิทยาศาสตร์ นักโหราศาสตร์ และนักวรรณคดี';
      case 'ราศีมีน':
        return 'ความมีใจอารีอารอบ ความมีเมตตากรุณาใจบุญ สุนทาน เห็นอกเห็นใจคนอื่น เข้ากับคนง่าย หวั่นไหวต่ออารมณ์ เจ้ายศเจ้าอย่าง เจ้าระเบียบ รักความประณีต เหมาะที่จะเป็นนักแสดง นักร้อง นักดนตรี นักวรรณคดี ผู้กำกับการแสดง จิตรกรรม และที่ต้องใช้มโนคติ';
      default:
        return 'ไม่มีข้อมูลคำทำนายในขณะนี้';
    }
  }

  Widget _buildDropdownButton({
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
        underline: const SizedBox(),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_day == null ||
          _month == null ||
          _year == null ||
          _hour == null ||
          _minute == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบทุกฟิลด์')),
        );
        return;
      }

      if (!_isValidDate(_year!, _month!, _day!)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('วันที่ไม่ถูกต้อง')));
        return;
      }

      setState(() {
        _showResult = true;
        _predictionData = {
          'name': _name,
          'date': DateTime(_year!, _month!, _day!),
          'time': TimeOfDay(hour: _hour!, minute: _minute!),
          'zodiacSign': _calculateZodiacSign(),
          'predictionText': _getPredictionText(),
        };
      });
    }
  }

  void _resetForm() {
    setState(() {
      _showResult = false;
      _name = '';
      _day = null;
      _month = null;
      _year = null;
      _hour = null;
      _minute = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showResult
        ? PredictionResultPage(data: _predictionData!, onBack: _resetForm)
        : _buildPredictionForm();
  }

  Widget _buildPredictionForm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const Text(
            "กรอกข้อมูลเพื่อเริ่มการทำนาย",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            width: 350,
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFF9BCDDF),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ชื่อ',
                      filled: true,
                      fillColor: Colors.amber[100],
                    ),
                    onChanged: (value) => setState(() => _name = value),
                    validator:
                        (value) =>
                            value?.isEmpty ?? true
                                ? 'กรุณากรอกชื่อของคุณ'
                                : null,
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('วัน/เดือน/ปี'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownButton(
                          hintText: 'วัน',
                          value: _day,
                          items:
                              _daysList
                                  .map(
                                    (day) => DropdownMenuItem(
                                      value: day,
                                      child: Text(day.toString()),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) => setState(() => _day = value),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDropdownButton(
                          hintText: 'เดือน',
                          value: _month,
                          items:
                              List.generate(12, (index) => index + 1)
                                  .map(
                                    (month) => DropdownMenuItem(
                                      value: month,
                                      child: Text(month.toString()),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() => _month = value);
                            _updateDays();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDropdownButton(
                          hintText: 'ปี',
                          value: _year,
                          items:
                              List.generate(
                                    100,
                                    (index) => DateTime.now().year - index,
                                  )
                                  .map(
                                    (year) => DropdownMenuItem(
                                      value: year,
                                      child: Text(year.toString()),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setState(() => _year = value);
                            _updateDays();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('เวลาเกิด'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownButton(
                          hintText: 'ชั่วโมง',
                          value: _hour,
                          items:
                              List.generate(24, (index) => index)
                                  .map(
                                    (hour) => DropdownMenuItem(
                                      value: hour,
                                      child: Text(hour.toString()),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) => setState(() => _hour = value),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDropdownButton(
                          hintText: 'นาที',
                          value: _minute,
                          items:
                              List.generate(60, (index) => index)
                                  .map(
                                    (minute) => DropdownMenuItem(
                                      value: minute,
                                      child: Text(minute.toString()),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) => setState(() => _minute = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 260.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(189, 218, 170, 1),
              ),
              child: const Text('ทำนาย'),
            ),
          ),
        ],
      ),
    );
  }
}
