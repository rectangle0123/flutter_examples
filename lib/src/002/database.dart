import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

/// データベース（シングルトン）
class Database {
  // インスタンス
  static final Database _instance = Database._();

  // データベース
  sqflite.Database _database;

  /// コンストラクタ
  Database._();

  /// ファクトリ
  factory Database() => _instance;

  /// データベースの取得
  get database async {
    if (_database != null) return _database;
    _database = await _open();
    return _database;
  }

  // データベースオープン
  Future<sqflite.Database> _open() async {
    String path = join(await sqflite.getDatabasesPath(), 'example.db');
    return await sqflite.openDatabase(path,
        version: 1,
        onCreate: _init,
    );
  }

  // データベースの初期化
  Future<void> _init(sqflite.Database db, int version) async {
    await db.execute('CREATE TABLE props (key TEXT PRIMARY KEY, value)');
    await db.execute("INSERT INTO props VALUES ('fruit', 0)");
  }

  /// 更新
  Future<int> update(String table, Map<String, dynamic> row) async {
    sqflite.Database db = await _instance.database;
    return await db.insert(table, row,
      conflictAlgorithm: sqflite.ConflictAlgorithm.replace,);
  }

  /// 参照（全件）
  Future<Map<String, dynamic>> queryAll(String table) async {
    sqflite.Database db = await _instance.database;
    List<Map<String, dynamic>> result = await db.query(table);
    Map<String, dynamic> map = {};
    result.forEach((e) {map[e['key']] = e['value'];});
    return map;
  }
}