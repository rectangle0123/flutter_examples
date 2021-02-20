import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

/// Index.
/// 使用パッケージ
/// - http
/// - provider
class Index extends StatelessWidget {
  /// タイトル
  static const title = 'API, BLoC, ListView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // プロバイダの定義
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Bloc()),
          ],
          child: List(),
        ),
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
          onRefresh: () async => context.read<Bloc>().update(),
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

  /// コンストラクタ
  SampleCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: ListTile(
          leading: Image(
            image: AssetImage('assets/images/wikipedia-logo.png'),
          ),
          title: Text(title, overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }
}