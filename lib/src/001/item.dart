/// アイテム
class Item {
  // ID
  final int id;
  // タイトル
  final String title;

  Item(this.id, this.title);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['id'], json['title']);
  }
}