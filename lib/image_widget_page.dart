import 'package:flutter/material.dart';
import 'route_param_page.dart' show ExtractArgumentsScreen, ScreenArguments;

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

const descTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontFamily: 'Roboto', letterSpacing: 0.5, fontSize: 18, height: 2);

final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.kitchen,
                color: Colors.green[500],
              ),
              Text('PREP:'),
              Text('25 min')
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Colors.green[500],
              ),
              Text('COOK:'),
              Text('1 hr')
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.restaurant,
                color: Colors.green[500],
              ),
              Text('FEEDS:'),
              Text('4-6')
            ],
          )
        ],
      ),
    ));

final leftColumn = Container(
  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
  child: Column(
    children: <Widget>[ratings, iconList],
  ),
);


class ImagePage extends StatelessWidget {
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,
        arguments: ScreenArguments('Extract Arguments Screen', 'This message is extracted in the build method.'));
    print('result: $result');
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(result),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局案例2'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 440,
                child: leftColumn,
              ),
              Image.network(
                'https://cdn.zhangzisi.com/timthumb/timthumb.php?src=https://cdn.zhangzisi.com/wp-content/uploads/2016/12/1252262ww.jpg&w=240&h=180',
                fit: BoxFit.cover,
              ),
              Builder(
                builder: (ctx) => OutlineButton(
                  child: Text('携带参数去下一页'),
                  onPressed: () => _navigateAndDisplaySelection(ctx),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
