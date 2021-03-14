import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'item.dart';

/// API（シングルトン）
class Api {
  // Wikipediaの記事を10件ランダムに取得するAPI
  static const url = 'https://ja.wikipedia.org/w/api.php?'
      'format=json&action=query&list=random&rnnamespace=0&rnlimit=10';

  static final Api _instance = Api._();

  Api._();

  factory Api() => _instance;

  /// リクエスト
  Future<List<Item>> request() async {
    http.Response response = await http.get(url);
    var parsed = json.decode(response.body);
    var data = parsed['query']['random'] as List<dynamic>;
    return data.map((e) => Item.fromJson(e)).toList();
  }
}