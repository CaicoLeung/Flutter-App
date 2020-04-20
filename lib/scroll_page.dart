import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  final List<String> items;

  ScrollPage({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Long Test'),),
      body: ListView.builder(
        key: Key('long_list'),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            key: Key('item_${index}_text'),
          );
        }
      ),
    );
  }
}