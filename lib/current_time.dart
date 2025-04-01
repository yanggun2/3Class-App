import 'package:flutter/material.dart';
import 'dart:async'; // 비동기 작업(예: 타이머)을 처리하는 데 필요

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentDate = '';
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    // 매초 현재 시간 갱신
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now();
        currentDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
        currentTime = formatTime(now);
      });
    });
  }

  // 오전/오후와 시간 포맷
  String formatTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? "오후" : "오전";
    int hour = dateTime.hour % 12;
    if (hour == 0) hour = 12; // 오전 12시, 오후 12시 처리
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');
    return "$period $hour:$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("현재 시각"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentDate,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10), // 날짜와 시간 사이 간격
            Text(
              currentTime,
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
