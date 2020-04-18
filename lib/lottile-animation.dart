import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  @override
  _LottiePageState createState() => new _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('拆红包Lottie'),),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 270,
          child: Lottie.asset('assets/json/hongbao.json'),
        ),
      ),
    );
  }
}
