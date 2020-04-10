import 'package:flutter/material.dart';
import 'TestFlowDelegate.dart' show TestFlowDelegate;

class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局例子'),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: <Widget>[
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('CC'),
                ),
                label: Text('Caico'),
              ),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('M'),
                ),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('A'),
                ),
                label: Text('Caico'),
              ),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('A'),
                ),
                label: Text('Caico'),
              ),
            ],
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(width: 80.0, height: 80.0, color: Colors.red,),
              Container(width: 80.0, height: 80.0, color: Colors.green,),
              Container(width: 80.0, height: 80.0, color: Colors.blue,),
              Container(width: 80.0, height: 80.0, color: Colors.yellow,),
              Container(width: 80.0, height: 80.0, color: Colors.brown,),
              Container(width: 80.0, height: 80.0, color: Colors.purple,),
            ],
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 2.0, style: BorderStyle.solid)),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  width: 20.0,
                  height: 20.0,
                  child: Container(
                    color: Colors.teal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
