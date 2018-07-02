import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);


  @override
  SecondScreenState createState() => new SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text('Second Screen'),
    );
  }
}