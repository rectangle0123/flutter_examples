import 'package:flutter/material.dart';

import 'database.dart';

/// BLoC
class Bloc extends ChangeNotifier {
  // プロパティ
  Map<String, dynamic> props = {};

  // プロパティの初期化
  void setup() {
    Database().queryAll('props').then((value) {
      props = value;
      // プロパティの更新を通知する
      notifyListeners();
    });
  }

  // データベースの更新
  void update(String key, dynamic value) {
    Database().update('props', {'key': key, 'value': value}).then((value) {
      // プロパティを初期化する
      setup();
    });
  }
}