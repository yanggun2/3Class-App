import 'package:untitleda7_1/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          _buildTop(),
          SizedBox(height: 16),
          _buildMiddle(),
          SizedBox(height: 16),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTaxiMenu(),
              _buildTaxiMenu(),
              _buildTaxiMenu(),
              _buildTaxiMenu(),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTaxiMenu(),
              _buildTaxiMenu(),
              _buildTaxiMenu(),
              _buildTaxiMenu(visible: false),
            ],
          ),
        ],
      );
  }

  Widget _buildTaxiMenu({bool visible = true}) {
    return Opacity(
      opacity: visible ? 1.0 : 0.0,
      child:
      InkWell(
        onTap: () {},
        child: Column(children: [Icon(Icons.local_taxi, size: 40),Text('택시')]),
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
        items:
        dummyImtems.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(url, fit: BoxFit.cover),
            //decoration: BoxDecoration(color: Colors.amber),
            //child: Text('text $i', style: TextStyle(fontSize: 16.0)),
          );
        },
      )};
  }).toList(),
  options: CarouselOptions(height: 150.0, autoPlay: true),
};
}

Widget _buildBottom() {
  final items = List.generate(10, (i) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text('[이벤트] 이것은 공지사항 $i입니다.'),
    );
  });

  return ListTile(
    physics: NeverScrollableScrollPhysics(),
    children: items,
    shrinWrap: true,
  );
}
}
