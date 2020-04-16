import 'package:flutter/material.dart';
import 'TestFlowDelegate.dart' show TestFlowDelegate;

Widget _buildStack() => Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage('https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
          radius: 100,
        ),
        Positioned(
          right: 30,
          bottom: 30,
          child: Text('Coco', style: TextStyle(color: Colors.white),),
        )
      ],
    );

List<Color> _colors = [ Colors.red, Colors.green, Colors.black54, Colors.blue, Colors.yellow, Colors.grey, Colors.purple ];

List<Widget> _buildFlowList() => _colors.map((color) => Container(
  width: 80.0,
  height: 80.0,
  color: color,
),).toList();

List<String> _nameList = ['CaicoLeung', 'LilyChan', 'MeJson', 'Mile'];

List<Chip> _buildChipList() => _nameList.map((name) => Chip(
  avatar: CircleAvatar(
    backgroundColor: Colors.blue,
    child: Text(name[0]),
  ),
  label: Text(name),
),).toList();

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
            children: _buildChipList()
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: _buildFlowList()
          ),
          _buildStack()
        ],
      ),
    );
  }
}
