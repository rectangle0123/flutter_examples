/// アイテム
class Item {
  // ID
  final int id;
  // タイトル
  final String title;

  /// コンストラクタ
  Item(this.id, this.title);

  /// ファクトリ
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['id'], json['title']);
  }
}