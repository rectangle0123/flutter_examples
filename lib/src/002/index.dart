import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

/// Index
///
/// 使用パッケージ
/// - http
/// - provider
class Index extends StatelessWidget {
  // タイトル
  static const title = 'API, BLoC, ListView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: List(),
      ),
    );
  }
}

/// リスト
class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BLoCを更新する
    context.read<Bloc>().update();
    // BLoCからリストを描画する
    return Consumer<Bloc>(
      builder: (context, bloc, child) {
        return RefreshIndicator(
          onRefresh: () async => bloc.update(),
          child: ListView.builder(
            itemCount: bloc.items.length,
            itemBuilder: (context, index) {
              return SampleCard(bloc.items[index].title);
            },
          ),
        );
      },
    );
  }
}

/// カード
class SampleCard extends StatelessWidget {
  // タイトル
  final String title;

  SampleCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: ListTile(
          leading: Image(
            width: 40,
            image: AssetImage('assets/images/wikipedia.png'),
          ),
          title: Text(title, overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }
}