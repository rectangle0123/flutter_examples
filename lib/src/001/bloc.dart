import 'package:flutter/material.dart';

import 'api.dart';
import 'item.dart';

/// BLoC
class Bloc extends ChangeNotifier {
  // アイテムリスト
  List<Item> items = [];

  // アイテムリストの更新
  Future<void> update() async {
    // アイテムリストをAPIから取得する
    items = await Api().request();
    // 変更を通知する
    notifyListeners();
 }
}