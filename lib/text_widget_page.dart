import 'package:flutter/material.dart';

class InfiniterGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InfiniterGridViewState();
}

class _InfiniterGridViewState extends State<InfiniterGridView> {
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            if(index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.line_style,
          Icons.mail_outline,
          Icons.offline_bolt,
          Icons.wb_cloudy,
          Icons.cached,
          Icons.g_translate,
          Icons.dashboard,
        ]);
      });
    });
  }
}
