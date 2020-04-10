import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = '';
    icons += '\uE914';
    icons += '\uE000';
    icons += '\uE90D';
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Example'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          children: <Widget>[
            Text(icons, style: TextStyle(fontFamily: 'MaterialIcons', fontSize: 24.0, color: Colors.blue),),
            Image.asset(
              'assets/icon/home-sec.png',
              width: 50,
            ),
            Image.network(
              'https://wallpapercave.com/wp/wp5869420.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.fitWidth,
            )
          ],
        )),
      ),
    );
  }
}
