import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(id: json['id'] as int, title: json['title'] as String, thumbnailUrl: json['thumbnailUrl'] as String);
  }
}

Future<List<Photo>> fetchPhoto(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/photos');
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class HttpPhotosPage extends StatefulWidget {
  @override
  _HttpPhotosPageState createState() => new _HttpPhotosPageState();
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: photos.length,
      itemBuilder: (context, index) => FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: photos[index].thumbnailUrl),
    );
  }
}

class _HttpPhotosPageState extends State<HttpPhotosPage> {
  Future<List<Photo>> _futurePhoto;

  @override
  void initState() {
    super.initState();
    setState(() {
      _futurePhoto = fetchPhoto(http.Client());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch...'),
        ),
        body: FutureBuilder<List<Photo>>(
          future: _futurePhoto,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? PhotoList(photos: snapshot.data,)
                : Center(child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
