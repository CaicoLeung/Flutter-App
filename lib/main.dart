import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'text_widget_page.dart' show InfiniterGridView;
import 'button_widget_page.dart' show ScrollControllerTestPage;
import 'image_widget_page.dart' show ImagePage;
import 'switch_checkbox_widget_page.dart' show InheritedWidgetTestRoute;
import 'textfield_widget_page.dart' show TextFieldPage;
import 'progress_widget_page.dart' show ProgressPage;
import 'layout_widget/row.dart' show RowPage;
import 'layout_widget/ProviderRoute.dart' show Product, ShoppingList;
import 'card_route_page.dart' show CardRoutePage;
import 'layout_widget/layout1_route_page.dart' show LayoutPageOne;
import 'widget_state_page.dart' show ParentWidget;
import 'route_param_page.dart' show ExtractArgumentsScreen;
import 'http_page.dart' show HttpPage;
import 'http_compute_page.dart' show HttpPhotosPage;
import 'file_reader_page.dart' show FilePage, CounterStorage;
import 'lottile-animation.dart' show LottiePage;
import 'shared_ preferences_page.dart' show SharedPreferencesPage;
import 'video_page.dart' show VideoPlayerScreen;
import 'camera_page.dart' show CameraPage;
import 'scroll_page.dart' show ScrollPage;

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  print("[相机列表]: $cameras");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '至尊宝物',
      initialRoute: 'home',
      theme: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.white),
      routes: {
        'home': (context) => MyHomePage(),
        'text': (context) => InfiniterGridView(),
        'button': (context) => ScrollControllerTestPage(),
        'image': (context) => ImagePage(),
        'switch': (context) => InheritedWidgetTestRoute(),
        'textfield': (context) => TextFieldPage(),
        'progress': (context) => ProgressPage(),
        'layout': (context) => RowPage(),
        'constrained': (context) => ShoppingList(
              products: <Product>[Product(name: '鸡蛋', price: 3.02), Product(name: '面粉', price: 5.10), Product(name: '朱古力片', price: 52.00)],
            ),
        'Card': (context) => CardRoutePage(),
        ExtractArgumentsScreen.routeName : (context) => ExtractArgumentsScreen()
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
  int _counter = 0;
  List _menus = [
    {'name': 'Card', 'router': CardRoutePage()},
    {'name': 'Layout1', 'router': LayoutPageOne()},
    {'name': 'WidgetState', 'router': ParentWidget()},
    {'name': 'HttpFetch', 'router': HttpPage()},
    {'name': 'HttpPhotos', 'router': HttpPhotosPage()},
    {'name': 'FilePage', 'router': FilePage(storage: CounterStorage(),)},
    {'name': 'LottiePage', 'router': LottiePage()},
    {'name': 'SharedPreferences', 'router': SharedPreferencesPage(title: 'SharedPreferences',)},
    {'name': 'VideoPlayerScreen', 'router': VideoPlayerScreen()},
    {'name': 'ScrollPage', 'router': ScrollPage(items: List<String>.generate(1000, (i) => 'Item $i'))},
  ];
  List<Widget> _buildMenus(BuildContext context) => _menus
      .map((menu) => RaisedButton(
            child: Text(menu['name']),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => menu['router']));
            },
          ))
      .toList();
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words:
        _words.insertAll(_words.length - 1, generateWordPairs().take(20).map((f) => f.asPascalCase).toList());
      });
    });
  }

  @override
  void initState() {
    print('initState');
    super.initState();
    if (cameras.length > 0) {
      _menus.add({'name': 'CameraPage', 'router': CameraPage(camera: cameras[0],)},);
    }
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
            tabs: tabs.map((e) => Tab(text: e,)).toList(),
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
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text('$_counter', key: Key('counter'), style: Theme.of(context).textTheme.display1,),
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
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 0),
              children: _buildMenus(context),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '今天要背的单词: ',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _words.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      if (_words[index] == loadingTag) {
                        if (_words.length < 50) {
                          _retrieveData();
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              '没有更多了',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                      }
                      return ListTile(
                        title: Text(_words[index]),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        key: Key('counter'),
        tooltip: 'Increment',
        onPressed: _incrementCounter,
      ),
    );
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
