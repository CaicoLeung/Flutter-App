import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title),),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Yep!'),
              onPressed: () {
                Navigator.pop(context, 'Yep!');
              },
            ),
            FlatButton(
              child: Text('Nope!'),
              onPressed: () {
                Navigator.pop(context, 'Nope!');
              },
            ),
            Text(args.message),
          ],
        )
      ),
    );
  }
}