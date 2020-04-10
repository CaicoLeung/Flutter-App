import 'package:flutter/material.dart';

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

class ConstrainedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('么么哒'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text('Login', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

//Unexpected key "bannerTypeList" found in preloadedState argument passed to createStore. Expected to find one of the known reducer keys instead: "admin", "router". Unexpected keys will be ignored.