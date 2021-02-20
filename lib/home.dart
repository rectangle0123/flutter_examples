import 'package:flutter/material.dart';

import 'menu.dart';

/// ホーム
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter サンプル'),
        ),
        drawer: Menu(),
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}