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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5주차 과제 1번'),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          color: Colors.black, // 바깥 테두리
          child: Column(
            children: [
              // 상단 1/2
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    // 왼쪽 빨간색
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    // 오른쪽 파란색 + 아래 검정색, 오렌지색
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          // 상단 파란색
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          // 하단 검정색, 오렌지색
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                // 왼쪽 검정색
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                ),
                                // 오른쪽 오렌지색
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 하단 노란색
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
