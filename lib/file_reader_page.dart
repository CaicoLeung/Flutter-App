import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  // 找到正确的本地路径
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//  创建一个指向文件位置的引用
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.text');
  }

// 将数据写入文件
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

// 从文件读取数据
  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }
}

// 页面
class FilePage extends StatefulWidget {
  final CounterStorage storage;

  FilePage({Key key, @required this.storage}): super(key: key);

  @override
  _FilePageState createState() => new _FilePageState();
}

// State
class _FilePageState extends State<FilePage> {
  int _counter;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _incrementCounter() {
    widget.storage.writeCounter(++_counter).then((File file) {
      widget.storage.readCounter().then((int value) {
        setState(() {
          _counter = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files'),),
      body: Center(
        child: RichText(
          text: TextSpan(
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              text: 'Button tapped ',
              children: <TextSpan>[
                TextSpan(text: '$_counter', style: TextStyle(color: Colors.red, fontSize: 16.0)),
                TextSpan(text: " time${_counter == 1 ? '' : 's'}"),
              ]
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
