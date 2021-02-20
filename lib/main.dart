import 'package:flutter/material.dart';

import 'home.dart';

/// main
void main() => runApp(App());

/// App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}