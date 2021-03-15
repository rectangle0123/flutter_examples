import 'package:flutter/material.dart';

/// Index
class Index extends StatelessWidget {
  /// タイトル
  static const title = 'テンプレート';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text('Nothing but a template'),
        ),
      ),
    );
  }
}