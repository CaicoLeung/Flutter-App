import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'text_widget_page.dart' show InfiniterGridView;
import 'button_widget_page.dart' show ScrollControllerTestPage;
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
      title: '至尊宝物',
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white
      ),
      routes: {
        'home': (context) => MyHomePage(),
        'text': (context) => InfiniterGridView(),
        'button': (context) => ScrollControllerTestPage(),
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
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget setTabbarItem(String path) {
  return Container(
    width: 32.0,
    height: 32.0,
    child: Image.asset(path),
  );
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];
  int _selectedIndex = 0;
  String words = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words: _words.insertAll(_words.length - 1, generateWordPairs().take(20).map((f) => f.asPascalCase).toList());
      });
    });
  }

  @override
  void initState() {
    print('initState');
    super.initState();
    _tabController = TabController(initialIndex: 0, length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print('当前Tabs index: ${_tabController.index}');
    });
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
          title: Text('至尊宝物'),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
          backgroundColor: Colors.white,
          textTheme: TextTheme(title: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20, fontWeight: FontWeight.w600)),
        ),
        drawer: new MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 22.0,
          selectedItemColor: Color.fromRGBO(255, 51, 95, 1),
          unselectedItemColor: Color.fromRGBO(74, 74, 74, 1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('assets/tabbar/faxian.png'), activeIcon: Image.asset('assets/tabbar/faxian-select.png'), title: Text('首页')),
            BottomNavigationBarItem(icon: setTabbarItem('assets/tabbar/release.png'), title: Text('')),
            BottomNavigationBarItem(
                icon: Image.asset('assets/tabbar/wode-not.png'), activeIcon: Image.asset('assets/tabbar/wode.png'), title: Text('我的')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
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
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: words.split('').map((f) => Text(f, style: TextStyle(height: 2),)).toList(),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(title: Text('今天要背的单词: ', style: TextStyle(decoration: TextDecoration.underline),),),
                Expanded(
                  child: ListView.separated(
                    itemCount: _words.length,
                    separatorBuilder: (context, index) => Divider(height: 1.0,),
                    itemBuilder: (context, index) {
                      if(_words[index] == loadingTag) {
                        if(_words.length < 50) {
                          _retrieveData();
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(strokeWidth: 2.0,),
                            ),
                          );
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16.0),
                            child: Text('没有更多了', style: TextStyle(color: Colors.grey),),
                          );
                        }
                      }
                      return ListTile(title: Text(_words[index]),);
                    },
                  ),
                )
              ],
            )
          ],
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

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
