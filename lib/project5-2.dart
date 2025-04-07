import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5주차 과제',
      theme: ThemeData.dark(), // 다크 모드
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350, // 박스 크기
          height: 650,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
          ),
          child: Column(
            children: [
              // 상단바 영역
              Container(
                height: 60, // 상단바 높이
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '5주차 과제 2번',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // 화면 영역
              Container(
                height: 100,
                color: Colors.black,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0), // 오른쪽 여백 추가
                    child: Text(
                      '0', // 숫자 0 표시
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                      ),
                    ),
                  ),
                ),
              ),
              // 메모리 버튼 영역
              Container(
                height: 50,
                color: Colors.black, // 배경색 검정으로 변경
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMemoryButton('MC'),
                    _buildMemoryButton('MR'),
                    _buildMemoryButton('M+'),
                    _buildMemoryButton('M-'),
                    _buildMemoryButton('MS'),
                    _buildMemoryButton('M'),
                  ],
                ),
              ),
              // 기타 버튼 영역
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4, // 버튼을 4개씩 배치
                  children: List.generate(20, (index) {
                    return _buildButton(index);
                  }),
                  mainAxisSpacing: 2.0, // 여백 줄이기
                  crossAxisSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 메모리 버튼을 위한 위젯
  Widget _buildMemoryButton(String text) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // 기타 버튼을 위한 위젯
  Widget _buildButton(int index) {
    Color buttonColor = Colors.grey[850]!; // 기본 색상

    // 버튼 색상 변경
    if (index == 19) {
      buttonColor = Colors.blue[700]!; // '=' 버튼
    } else if ([18, 17, 16, 14, 13, 12, 10, 9, 8, 6, 5, 4].contains(index)) {
      buttonColor = Colors.grey[600]!; // 밝은 회색
    }

    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 60,
      child: Center(
        child: Text(
          _getButtonText(index),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  // 버튼 텍스트 반환
  String _getButtonText(int index) {
    const buttonLabels = [
      '%', 'CE', 'C', '÷', '7', '8', '9', '×',
      '4', '5', '6', '-', '1', '2', '3', '+',
      '±', '0', '.', '=', '√'
    ];
    return buttonLabels[index];
  }
}
