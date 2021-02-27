import 'package:flutter/material.dart';

import 'api.dart';
import 'item.dart';

/// BLoC
class Bloc extends ChangeNotifier {
  // アイテムリスト
  List<Item> items = [];

  // アイテムリストの更新
  void update() {
    // アイテムリストをAPIから取得する
    Api().request().then((value) {
      items = value;
      // 変更を通知する
      notifyListeners();
    });
  }
}