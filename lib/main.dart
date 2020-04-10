import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'text_widget_page.dart' show TextPage;
import 'button_widget_page.dart' show ButtonPage;
import 'image_widget_page.dart' show ImagePage;
import 'switch_checkbox_widget_page.dart' show SwitchCheckBoxPage;
import 'textfield_widget_page.dart' show TextFieldPage;
import 'progress_widget_page.dart' show ProgressPage;
import 'layout_widget/row.dart' show RowPage;
import 'layout_widget/constrainedBox.dart' show ConstrainedPage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => MyHomePage(title: '聚友财', color: Color.fromRGBO(251, 219, 76, 1)),
        'text': (context) => TextPage(),
        'button': (context) => ButtonPage(),
        'image': (context) => ImagePage(),
        'switch': (context) => SwitchCheckBoxPage(),
        'textfield': (context) => TextFieldPage(),
        'progress': (context) => ProgressPage(),
        'layout': (context) => RowPage(),
        'constrained': (context) => ConstrainedPage()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];
  int _selectedIndex = 0;

  @override
  void initState() {
    print('initState');
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e,)).toList(),
          ),
          backgroundColor: widget.color,
          centerTitle: false,
          textTheme: TextTheme(title: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20, fontWeight: FontWeight.w600)),
        ),
        drawer: new MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: Center(
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.blueAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  color: Colors.yellow,
                  icon: Icon(Icons.short_text),
                  label: Text('Process'),
                  onPressed: () => Navigator.pushNamed(context, 'progress'),
                ),
                FlatButton.icon(
                  color: Colors.cyan,
                  icon: Icon(Icons.inbox),
                  label: Text('ConstrainedBox'),
                  onPressed: () => Navigator.pushNamed(context, 'constrained'),
                ),
                FlatButton.icon(
                  color: Colors.deepPurpleAccent,
                  icon: Icon(Icons.receipt),
                  label: Text('layout'),
                  onPressed: () => Navigator.pushNamed(context, 'layout'),
                ),
                FlatButton(
                  child: Icon(Icons.input),
                  onPressed: () => Navigator.pushNamed(context, 'textfield'),
                ),
                RaisedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, 'switch'),
                    color: Colors.teal,
                    icon: Icon(
                      Icons.pan_tool,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Switch_Widget',
                      style: TextStyle(color: Colors.white),
                    )),
                RaisedButton(
                  child: Text('Button_Widget'),
                  onPressed: () => Navigator.pushNamed(context, 'button'),
                ),
                FlatButton(
                  child: Text('Text_Widget'),
                  onPressed: () => Navigator.pushNamed(context, 'text'),
                ),
                OutlineButton.icon(onPressed: () => Navigator.pushNamed(context, 'image'), icon: Icon(Icons.image), label: Text('Image_Widget'))
              ],
            ),
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {

  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key key }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          'https://wx.qlogo.cn/mmopen/vi_32/0nbBGO4kXc5uibIExzYvoibbdqcGAsyTAOL0LwNTMtC0eyhUzbfdf0LIEJWxFjWUG2xY91oLTAqQ3VSehbfckHyg/132',
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      'Caico',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage accounts'),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
