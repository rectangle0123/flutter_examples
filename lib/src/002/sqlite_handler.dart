import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// データベース（シングルトン）
class SqliteHandler {
  // インスタンス
  static final SqliteHandler _instance = SqliteHandler._();
  // DB
  Database _database;

  SqliteHandler._();

  factory SqliteHandler() => _instance;

  get database async {
    if (_database != null) return _database;
    _database = await _open();
    return _database;
  }

  // DBオープン
  Future<Database> _open() async {
    String path = join(await getDatabasesPath(), 'example.db');
    return await openDatabase(path,
        version: 1,
        onCreate: _init,
    );
  }

  // DBの初期化
  Future<void> _init(Database db, int version) async {
    await db.execute('CREATE TABLE props (key TEXT PRIMARY KEY, value)');
    await db.execute("INSERT INTO props VALUES ('fruit', 0)");
  }

  /// 更新
  Future<int> update(String table, Map<String, dynamic> row) async {
    Database db = await _instance.database;
    return await db.insert(table, row,
      conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  /// 参照（全件）
  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    Database db = await _instance.database;
    return await db.query(table);
  }
}