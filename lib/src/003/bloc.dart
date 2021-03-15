import 'package:flutter/material.dart';

import 'sqlite_handler.dart';

/// BLoC
class Bloc extends ChangeNotifier {
  // プロパティ
  Map<String, dynamic> props = {};

  // プロパティの初期化
  Future<void> init() async {
    // DBからプロパティを取得する
    List<Map<String, dynamic>> result = await SqliteHandler().queryAll('props');
    result.forEach((e) => props[e['key']] = e['value']);
    // 更新を通知する
    notifyListeners();
  }

  // プロパティの更新
  Future<void> update(String key, dynamic value) async {
    // プロパティを更新する
    props[key] = value;
    // 更新を通知する
    notifyListeners();
    // DBを更新する
    await SqliteHandler().update('props', {'key': key, 'value': value});
  }

  int get fruit {
    if (props.isEmpty) return null;
    return props['fruit'];
  }
}