import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Example'),
      ),
      body: Container(
        color: Colors.white,
        width: 375.0,
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineButton.icon(onPressed: (){}, icon: Icon(Icons.send), label: Text('发送')),
            RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.info), label: Text('详情')),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}