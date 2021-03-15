import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'item.dart';

/// API（シングルトン）
class Api {
  // Wikipediaの記事を10件ランダムに取得するAPI
  static const domain = 'ja.wikipedia.org';
  static const path = '/w/api.php';
  static const params = {
    'format': 'json',
    'action': 'query',
    'list': 'random',
    'rnnamespace': '0',
    'rnlimit': '10',
  };

  /// インスタンス
  static final Api _instance = Api._();

  /// コンストラクタ
  Api._();

  /// ファクトリコンストラクタ
  factory Api() => _instance;

  /// リクエスト
  Future<List<Item>> request() async {
    var url = Uri.https(domain, path, params);
    http.Response response = await http.get(url);
    var parsed = json.decode(response.body);
    var data = parsed['query']['random'] as List<dynamic>;
    return data.map((e) => Item.fromJson(e)).toList();
  }
}