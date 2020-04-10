import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      color: Colors.white,
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              height: 1.5,
              decoration: TextDecoration.none),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello World~~' * 5,
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
              Text.rich(TextSpan(
                children: <InlineSpan>[
                  TextSpan(text: 'HomePage: '),
                  TextSpan(
                    text: 'https://flutterchina.club',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              )),
              Text(
                  'CaicoLeung',
                  style: TextStyle(backgroundColor: Colors.black26)
              ),
              Text(
                '520',
                style: TextStyle(fontFamily: 'Bebas', color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
