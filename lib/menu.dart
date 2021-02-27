import 'package:flutter/material.dart';

import 'src/000/index.dart' as s000;
import 'src/001/index.dart' as s001;
import 'src/002/index.dart' as s002;

/// メニュー
class Menu extends StatelessWidget {
  final List<ListItem> items = [
    ListItem(s000.Index.title, (_) => s000.Index()),
    ListItem(s001.Index.title, (_) => s001.Index()),
    ListItem(s002.Index.title, (_) => s002.Index()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: List.generate(items.length, (index) {
          return ListTile(
            leading: FlutterLogo(),
            title: Text('${items[index].title}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: items[index].func));
            },
          );
        }),
      ),
    );
  }
}

/// メニューアイテム
class ListItem {
  final String title;
  final Function func;

  ListItem(this.title, this.func);
}