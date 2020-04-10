import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TextFieldState();
}

class _TextFieldState extends State<TextFieldPage> {
  bool _isFocusNode1HasFocus = false;
  TextEditingController _unmaneController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _unmaneController.text = 'Hello World!';
    _unmaneController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unmaneController.text.length);
    focusNode1.addListener(() {
      setState(() {
        _isFocusNode1HasFocus = focusNode1.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField Example'),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0))),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: _isFocusNode1HasFocus
                                        ? Colors.blue
                                        : Colors.grey[200],
                                    width: 1.0))),
                        child: TextFormField(
                          controller: _unmaneController,
                          focusNode: focusNode1,
                          decoration: InputDecoration(
                              labelText: '用户名',
                              hintText: '用户名或邮箱',
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none),
                          validator: (v) {
                            return v.trim().length > 0 ? null : '用户不能为空';
                          },
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '密码',
                            hintText: '您的登录密码',
                            prefixIcon: Icon(Icons.lock),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13.0)),
                        obscureText: true,
                        validator: (v) =>
                            v.trim().length > 5 ? null : '密码不能少于6位',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton.icon(
                                icon: Icon(Icons.send),
                                label: Text('登录'),
                                onPressed: () {
                                  if((_formKey.currentState as FormState).validate()) {
                                    print('校验通过');
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: RaisedButton.icon(
                                icon: Icon(Icons.email),
                                label: Text('注册'),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
