import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

/// Index
///
/// 使用パッケージ
/// - sqflite
/// - path
/// - provider
class Index extends StatelessWidget {
  // タイトル
  static const title = 'Sqfliteの取得と更新';
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // プロバイダの定義
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Your favorite fruit?',
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
class SampleDropDown extends StatelessWidget {
  // アイテムリスト
  final Map<int, String> _list = {
    0: 'None', 1: 'Apple', 2: 'Orange', 3: 'Banana',
  };

  @override
  Widget build(BuildContext context) {
    // プロパティを監視する
    return Consumer<Bloc>(
      builder: (context, bloc, child) {
        // プロパティを初期化する
        bloc.init();
        // ドロップダウンリストを作成する
        return DropdownButton<int>(
          value: bloc.fruit,
          icon: Icon(Icons.keyboard_arrow_down),
          underline: Container(height: 2, color: Colors.lightBlue),
          onChanged: (value) => bloc.update('fruit', value),
          items: _list.entries.map((e) {
            return DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            );
          }).toList(),
        );
      },
    );
  }
}