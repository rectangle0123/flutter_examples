import 'dart:math';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

/// Index
///
/// 使用パッケージ
/// - circular_menu
class Index extends StatelessWidget {
  /// タイトル
  static const title = 'デザイン';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.pink,
        // fontFamily: 'NotoSansJP',
        fontFamily: 'NotoSerifJP',
        scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(Index.title),
          ),
          body: CustomCircularMenu(),
        ),
      ),
    );
  }
}

/// メニュー
class CustomCircularMenu extends StatelessWidget {
  // リストアイテム
  final List<Map<String, dynamic>> _items = [
    {'color': 'FF4CAF50', 'head': 'タイトル 1', 'body': '今日は良い天気です。'},
    {'color': 'FFFF9800', 'head': 'タイトル 2', 'body': '今日は良い天気です。'},
    {'color': 'FF673AB7', 'head': 'タイトル 3', 'body': '今日は良い天気です。'},
  ];

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      alignment: Alignment.bottomRight,
      startingAngleInRadian: pi,
      endingAngleInRadian: 1.5 * pi,
      toggleButtonColor: Colors.pink,
      toggleButtonBoxShadow: [CustomBoxShadow(),],
      backgroundWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    _items[index]['color'],
                    _items[index]['head'],
                    _items[index]['body'],
                  );
                },
              ),
            ),
          ]
        ),
      ),
      items: [
        CircularMenuItem(
          icon: Icons.settings,
          color: Colors.orange,
          boxShadow: [CustomBoxShadow(),],
          onTap: () {},
        ),
        CircularMenuItem(
          icon: Icons.location_on,
          color: Colors.green,
          boxShadow: [CustomBoxShadow(),],
          onTap: () {},
        ),
        CircularMenuItem(
          icon: Icons.mode_edit,
          color: Colors.blue,
          boxShadow: [CustomBoxShadow(),],
          onTap: () {},
        ),
      ],
    );
  }
}

/// ボタンシャドウ
class CustomBoxShadow extends BoxShadow {
  CustomBoxShadow() : super(
    color: Colors.black45,
    offset: Offset(2, 4),
    blurRadius: 4.0,
    spreadRadius: 0.4,
  );
}

/// カード
class CustomCard extends StatelessWidget {
  final String color;
  final String head;
  final String body;

  CustomCard(this.color, this.head, this.body, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Color(int.parse(color, radix: 16));
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: InkWell(
          splashColor: _color.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 18.0,
              foregroundColor: Colors.white,
              backgroundColor: _color,
              child: Icon(Icons.mode_edit),
            ),
            title: Text(head,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,),
            subtitle: Text(body, overflow: TextOverflow.ellipsis,),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
