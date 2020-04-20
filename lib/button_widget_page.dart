import 'dart:ui';
import 'package:flutter/material.dart';

class ScrollControllerTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScrollControllerTestPageState();
}

class _ScrollControllerTestPageState extends State<ScrollControllerTestPage> {
  ScrollController _scrollController = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset > 800) {
        setState(() {
          showToTopBtn = true;
        });
      } else if (_scrollController.offset <= 1000 && showToTopBtn == true) {
        setState(() {
          showToTopBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Caico'),
              background: SizedBox(
                width: 20.0,
                height: 20.0,
                child: Image.network(
                  'https://wx.qlogo.cn/mmopen/vi_32/0nbBGO4kXc5uibIExzYvoibbdqcGAsyTAOL0LwNTMtC0eyhUzbfdf0LIEJWxFjWUG2xY91oLTAqQ3VSehbfckHyg/132',
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all((8.0)),
            sliver: SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: 4.0),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('Grid item $index'),
                );
              }, childCount: 30),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 50),
          ),
        ],
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_up),
        onPressed: () {
          _scrollController.animateTo(0.0, duration: Duration(milliseconds: 250), curve: Curves.ease);
        },
      ),
    );
  }
}
