import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Index
class Index extends StatelessWidget {
  /// タイトル
  static const title = '国際化と地域化';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              SampleCard('Text', AppLocalizations.of(context).helloWorld),
              SampleCard('UTC', DateTime.now().toUtc().toString()),
              // SampleCard('JST', DateTime.now().toString()),
              SampleCard('JST', DateTime.now().toUtc().toLocal().toString()),
            ],
          ),
        ),
      ),
    );
  }
}

/// カード
class SampleCard extends StatelessWidget {
  final String title;
  final String subtitle;

  SampleCard(this.title, this.subtitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}