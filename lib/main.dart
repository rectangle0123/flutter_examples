import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'src/003/bloc.dart' as s003;
import 'src/005/bloc.dart' as s005;

void main() => runApp(App());

/// App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => s003.Bloc()),
        ChangeNotifierProvider(create: (_) => s005.Bloc()),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}