import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if(response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Fail to load album');
  }
}

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String> {
      'title': title
    })
  );

  if(response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  Album({this.title, this.id, this.userId});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title']
    );
  }
}

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => new _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  Future<Album> _futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetch...'),),
      body: Center(
        child: (_futureAlbum == null) ?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
            ),
            RaisedButton(
              child: Text('Create Date'),
              onPressed: () {
                setState(() {
                  _futureAlbum = createAlbum(_controller.text);
                });
              },
            )
          ],
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Create Result: ${snapshot.data.title}, id: ${snapshot.data.id.toString()}'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                return CircularProgressIndicator();
              },
            )
          ],
        )
      ),
    );
  }
}