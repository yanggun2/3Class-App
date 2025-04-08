import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final items = List.generate(100, (i) => i).toList();
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  State<MyHomePage> createState() => _MyHomePageState(); // Define the createState method
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제목'),
      ),
      /* body: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: Text('모도리'),

            ),
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(16.0),
              color: Colors.red,
              child: Text('모도리'),
            ),
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(16.0),
              color: Colors.green,
              child: Text('모도리'),
            ),
          ],
        )*/
      // body: Row(
      //   children: [
      //     Container(
      //       width: 100,
      //       height: 100,
      //       margin: EdgeInsets.all(10.0),
      //       padding: EdgeInsets.all(16.0),
      //       color: Colors.blue,
      //       child: Text('모도리'),
      //
      //     ),
      //     Container(
      //       width: 100,
      //       height: 100,
      //       margin: EdgeInsets.all(10.0),
      //       padding: EdgeInsets.all(16.0),
      //       color: Colors.red,
      //       child: Text('모도리'),
      //     ),
      //     Container(
      //       width: 100,
      //       height: 100,
      //       margin: EdgeInsets.all(10.0),
      //       padding: EdgeInsets.all(16.0),
      //       color: Colors.green,
      //       child: Text('모도리'),
      //     ),
      //   ],
      // )
      //
/////////// 위젯들을 순서대로 겹치게 함 ///////////
//       body: Stack(
//         children: [
//           Center(
//             child: Container(
//             color: Colors.red,
//             width: 100,
//             height: 100,
//             padding: const EdgeInsets.all(8.0),
//             margin: const EdgeInsets.all(8.0),
//             )
//           ),
//           Center(
//               child: Container(
//                 color: Colors.green,
//                 width: 80,
//                 height: 80,
//                 padding: const EdgeInsets.all(8.0),
//                 margin: const EdgeInsets.all(8.0),
//               )
//           ),
//           Center(
//               child: Container(
//                 color: Colors.blue,
//                 width: 60,
//                 height: 60,
//                 padding: const EdgeInsets.all(8.0),
//                 margin: const EdgeInsets.all(8.0),
//                 child: Center(child:Text('다모아')),
//               )
//           ),
//         ],
//       )
/////////////////////////////////////////////
//     body: SingleChildScrollView(
//       child: ListBody(
//         children: items.map((i) => Text('$i!!')).toList(),
//       )
//     )
/////////////////////////////////////////
//     body: ListView(
//       scrollDirection: Axis.vertical,
//       children: [
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text('홈'),
//           trailing: Icon(Icons.navigate_next),
//           onTap: () {}, ////// 익명함수
//         ),
//         ListTile(
//           leading: Icon(Icons.event),
//           title: Text('이벤트'),
//           trailing: Icon(Icons.navigate_next),
//           onTap: () {},
//         ),
//         ListTile(
//           leading: Icon(Icons.camera),
//           title: Text('카메라'),
//           trailing: Icon(Icons.navigate_next),
//           onTap: () {},
//         ),
//       ],
//     ),
//////////////////////////////////////// 그리드뷰
//     body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           Container(
//             color: Colors.red,
//             width: 100,
//             height: 100,
//             padding: const EdgeInsets.all(80.0), //실제 영향은 없음 텍스트를 넣어 효과 확인 가능
//             margin: const EdgeInsets.all(8.0),
//             child: Text('다모일'),
//           ),
//           Container(
//             color: Colors.green,
//             width: 100,
//             height: 100,
//             padding: const EdgeInsets.all(8.0),
//             margin: const EdgeInsets.all(8.0),
//             child: Text('다모이'),
//           ),
//           Container(
//             color: Colors.blue,
//             width: 100,
//             height: 100,
//             padding: const EdgeInsets.all(8.0),
//             margin: const EdgeInsets.all(8.0),
//             child: Text('다모삼'),
//           )
//         ],
//     ),
      ////////////////////////////////////// 페이지뷰
      //      body: PageView(
      //        children: [
      //          Container(
      //            color: Colors.red,
      //          ),
      //          Container(
      //            color: Colors.green,
      //          ),
      //          Container(
      //            color: Colors.blue,
      //          ),
      //        ],
      //      ),
      ////////////////////////////////////// 버튼 네비게이션바
      // body: Text('!'),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //   label: 'Home'
      //   ),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'person'
      //   ),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'notifications'
      //   ),
      // ]),
      ////////////////////////////////////// 센터
      // body: Center(
      //   child: Text('봄이 왔습니다'),
      // ),
      ///////////////////////////////////// 패딩
      // body: Padding(
      //   padding: const EdgeInsets.all(80.0),
      //   child: Container(
      //     color: Colors.red,
      //   ),
      // ),
      //////////////////////////////////// align
      // body: Align(
      //   alignment: Alignment.centerRight,
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     color: Colors.red,
      //   ),
      // ),
      //////////////////////////////////// Column / ROW
      // body: Column(
      //   children: [
      //     Expanded(
      //       flex: 2,
      //       child: Container(
      //         color: Colors.red,
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         color: Colors.green,
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         color: Colors.blue,
      //       ),
      //     ),
      //   ],
      // ),
      ///////////////////////////////////// SIZEDBOX
      // body: SizedBox(
      //   width: 400,
      //   height: 400,
      //   child: Container(
      //     color: Colors.red,
      //   ),
      // ),
      ///////////////////////////////////// CARD
      // body: Center(
      //   child: Card(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(40.0),
      //     ),
      //     elevation: 40.0, //그림자
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       child: Center(
      //         child: Text('생일 축하합니다!!!!!'),
      //       ),
      //     ),
      //   ),
      // ),
      ////////////////////////////////////// 각 버튼?
      // body: Row(
      //   children: [
      //     ElevatedButton(
      //       child: Text('RaisedButton'),
      //       onPressed: () {},
      //     ),
      //     TextButton(
      //       child: Text('TextButton'),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       color: Colors.red,
      //       iconSize: 100.0,
      //       onPressed: () {},
      //     ),
      //     FloatingActionButton(
      //         child: Icon(Icons.add),
      //         onPressed: () {}
      //     ),
      //   ],
      // ),
      //////////////////////////////////// text 활용
      // body: Center(
      //   child: Text(
      //     'Hello World',
      //     style: TextStyle(
      //       fontSize: 40.0,
      //       fontStyle: FontStyle.italic,
      //       fontWeight: FontWeight.w900, //bold
      //       color: Colors.green,
      //       letterSpacing: 4.0, //글자간 간견
      //     ),
      //   ),
      // ),
      ////////////////////////////////////// image url로 넣거나 폴더에 직접 넣기
      // body: Image.network('http://bit.ly/2pv'),
      // Image.asset('assets/car1.jpg')
      ////////////////////////////////////// CircleAvatar
      body: CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
 //////////////////////////////////////// 앱바 (코딩영역이 2개임 앱바영영과 바디영역)
 //    @override
 //    Widget build(BuildContext context) {
 //      return DefaultTabController(
 //          length: 3,
 //          child: Scaffold(
 //            appBar: AppBar(
 //              title: Text('Tab'),
 //              bottom: TabBar(
 //                  tabs: [
 //                    Tab(icon: Icon(Icons.tag_faces)),
 //                    Tab(text: '메뉴'),
 //                    Tab(icon: Icon(Icons.info), text: '메뉴3'),
 //              ],
 //            )
 //          ),
 //          body: TabBarView(
 //            children: [
 //              Container(color: Colors.yellow),
 //              Container(color: Colors.orange),
 //              Container(color: Colors.red),
 //            ],
 //          ),
 //        ),
 //      );
 //    }
  }