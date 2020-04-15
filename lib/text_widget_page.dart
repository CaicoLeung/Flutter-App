import 'package:flutter/material.dart';

class InfiniterGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InfiniterGridViewState();
}

class _InfiniterGridViewState extends State<InfiniterGridView> {
  List<IconData> _icons = [];
  static final bool showGrid = true;

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局演示'),),
      body: showGrid ? _buildGrid() : _buildList(),
      floatingActionButton: IconButton(
        icon: Icons,
      ),
    );
  }

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30),
      );

  Widget _buildList() => ListView(
        children: <Widget>[
          _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
          _tile('The Castro Theater', '429 Castro St', Icons.theaters),
          _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
          _tile('Roxie Theater', '3117 16th St', Icons.theaters),
          _tile('United Artists Stonestown Twin', '501 Buckingham Way', Icons.theaters),
          _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
          Divider(),
          _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
          _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
          _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
          _tile('La Ciccia', '291 30th St', Icons.restaurant),
        ],
      );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );

  List<Widget> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
            child: Image.network(
              'https://cdn.zhangzisi.com/timthumb/timthumb.php?src=https://cdn.zhangzisi.com/wp-content/uploads/2017/10/035346544.jpg&w=240&h=180',
              fit: BoxFit.cover,
            ),
          ));

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
