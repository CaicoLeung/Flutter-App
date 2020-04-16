import 'package:flutter/material.dart';

class LayoutPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Image.network('https://images.pexels.com/photos/1382734/pexels-photo-1382734.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', height: 400, fit: BoxFit.fill,),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey[500]),)
                  ],
                ),
              ),
              Icon(Icons.star, color: Colors.red[500],),
              Text('41')
            ],
          ),
          Divider()
        ],
      ),
    );
    Widget _buildButtonColumn(Color color, IconData icon, String label) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),),
        )
      ],
    );
    Color color = Colors.blue;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,),
    );

    return Material(
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 14, decoration: TextDecoration.none, color: Colors.black87),
        child: ListView(
          children: [
            titleection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}