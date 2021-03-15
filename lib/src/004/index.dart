import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Index
class Index extends StatelessWidget {
  /// タイトル
  static const title = 'ネイティブDBを使う';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Your favorite animal?',
                style: TextStyle(fontSize: 18),
              ),
              SampleDropDown(),
            ],
          ),
        ),
      ),
    );
  }
}

/// ドロップダウンメニュー
class SampleDropDown extends StatefulWidget {
  @override
  SampleDropDownState createState() => SampleDropDownState();
}

class SampleDropDownState extends State<SampleDropDown> {
  // アイテムリスト
  final Map<int, String> _list = {
    0: 'None', 1: 'Giraffes', 2: 'Elephants', 3: 'Hippos',
  };
  // 選択値
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getValue('animal'),
      builder: (context, AsyncSnapshot<int>snapshot) {
        if (snapshot.hasData) {
          return DropdownButton<int>(
            value: snapshot.data,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: Container(height: 2, color: Colors.orange),
            onChanged: (value) => _setValue('animal', value),
            items: _list.entries.map((e) {
              return DropdownMenuItem(
                value: e.key,
                child: Text(e.value),
              );
            }).toList(),
          );
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }

  // SharedPreferencesから取得
  Future<int> _getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selected = prefs.getInt(key) ?? 0;
    });
    return _selected;
  }

  // SharedPreferencesを更新
  Future<void> _setValue(String key, int value) async {
    setState(() {
      _selected = value;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
}