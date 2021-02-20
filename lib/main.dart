import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'src/001/bloc.dart' as s001;
import 'src/002/bloc.dart' as s002;

/// main
void main() => runApp(App());

/// App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => s001.Bloc()),
        ChangeNotifierProvider(create: (_) => s002.Bloc()),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}