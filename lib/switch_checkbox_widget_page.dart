import 'package:flutter/material.dart';

class SwitchCheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SwitchCheckBoxState();
}

class _SwitchCheckBoxState extends State {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Switch(
              value: _switchSelected,
              activeColor: Colors.teal,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
          ),
          Card(
            child: Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
