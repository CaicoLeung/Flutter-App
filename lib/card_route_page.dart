import 'package:flutter/material.dart';

class CardRoutePage extends StatelessWidget {
  Widget _buildCard() => SizedBox(
        height: 210,
        child: Card(
          elevation: 10,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  '1625 Main Street',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('My City, CA 99984'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('(408) 555-1212', style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text('costa@example.com'),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blue[500],
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: _buildCard(),
      ),
    );
  }
}
