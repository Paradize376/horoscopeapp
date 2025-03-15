import 'package:flutter/material.dart';
import 'zodiac_prediction_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(),
      routes: {
        '/zodiac': (context) => ZodiacPredictionPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('หน้าแรก')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/zodiac');
          },
          child: Text('ไปหน้าทำนายราศี'),
        ),
      ),
    );
  }
}
