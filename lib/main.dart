import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quadratic.dart';
import 'calculator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return new MaterialApp(
      title: 'Calculator Mk2',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator Mk2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum fragments { CALC, QUADF }

class _MyHomePageState extends State<MyHomePage> {
  static final fragments homeFragment = fragments.CALC;
  fragments currentFragment = homeFragment;
  String currentTitle = "Calculator Mk2";

  getCurrentFragment() {
    switch (currentFragment) {
      case fragments.CALC:
        {
          return new Calculator();
        }
      case fragments.QUADF:
        {
          return new QuadraticFormula();
        }
    }
  }

  Future<bool> backPressed() {
    setState(() {
      if (currentFragment == homeFragment) {
        SystemNavigator.pop();
      } else {
        currentFragment = homeFragment;
      }
    });
    return new Completer().future;
  }

  void newFragment(fragments fragment) {
    if (currentFragment != fragment) {
      setState(() {
        currentFragment = fragment;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      backgroundColor: new Color(0xFF212121),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(currentTitle),
      ),
      body: new WillPopScope(
          child: getCurrentFragment(), onWillPop: backPressed),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Image(
                image: new AssetImage('assets/osc.png')
              )
            ),
            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                newFragment(fragments.CALC);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.keyboard_arrow_right),
              title: new Text('Quadratic Formula'),
              onTap: () {
                Navigator.pop(context);
                newFragment(fragments.QUADF);
              },
            ),
          ],
        ),
      ),
    );
  }
}
