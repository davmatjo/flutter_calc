import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  CalculatorState createState() => new CalculatorState();
}

enum operation {
  ADD, DIV, MUL, SUB, NIL
}

class CalculatorState extends State<Calculator> {
  double displayValue = 0.0;
  double storedValue = 0.0;
  operation currentOp = operation.NIL;
  bool enteringSecond = false;
  static final int maxDisplayLength = 16;
  static final double keypadScaleFactor = 6.0;
  static final double operationScaleFactor = 5.0;
  static final FontWeight keypadWeight = FontWeight.w200;

  bool isDisplayInt() {
    return displayValue.floor() == displayValue;
  }

  String getDisplayValue() {
    if (isDisplayInt()) {
      return displayValue.floor().toString();
    } else {
      return displayValue.toString();
    }
  }

  void _handleNumber(int value) {
    setState(() {
      if (currentOp != operation.NIL && !enteringSecond) {
        displayValue = 0.0;
        enteringSecond = true;
      }

      if (isDisplayInt()) {
        if (displayValue.floor().toString().length < maxDisplayLength) {
          displayValue =
              double.parse(displayValue.floor().toString() + value.toString());
        }
      } else {
        if (displayValue.toString().length < maxDisplayLength) {
          displayValue =
              double.parse(displayValue.toString() + value.toString());
        }
      }
    });
  }

  void _handleBackspace() {
    setState(() {
      if (isDisplayInt()) {
        int displayValueInt = displayValue.floor();
        String displayValueString = displayValueInt.toString();
        int numlength = displayValueString.length;
        displayValue = double.parse(numlength > 1
            ? displayValueString.substring(0, numlength - 1)
            : '0');
      } else {
        int length = displayValue.toString().length;
        String displayValueString = displayValue.toString();
        displayValue = double.parse(
            length > 1 ? displayValueString.substring(0, length - 1) : '0');
      }
    });
  }

  void _handleOperation(operation op) {
    currentOp = op;
    storedValue = displayValue;
  }

  void _handleEquals() {
    if (enteringSecond) {
      setState(() {
        switch (currentOp) {
          case operation.ADD:
            {
              displayValue = storedValue + displayValue;
              break;
            }
          case operation.SUB:
            {
              displayValue = storedValue - displayValue;
              break;
            }
          case operation.MUL:
            {
              displayValue = storedValue * displayValue;
              break;
            }
          case operation.DIV:
            {
              if (displayValue != 0.0) {
                displayValue = storedValue / displayValue;
              }
              break;
            }
          case operation.NIL:
            {
              break;
            }
        }
      });
    }

    currentOp = operation.NIL;
    enteringSecond = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: new Container(
        color: new Color(0xFF212121),
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Spacer(
              flex: 1,
            ),
            new Text(
              getDisplayValue(),
              textScaleFactor: 2.0,
              style: new TextStyle(color: Colors.white),
            ),
            new Spacer(
              flex: 1,
            ),
            new Container(
              color: new Color(0xFF004ba0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                      color: Colors.black12,
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                onPressed: () => _handleNumber(1),
                                child: new Text(
                                  '1',
                                  textScaleFactor: keypadScaleFactor,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: keypadWeight),
                                ),
                              ),
                              new FlatButton(
                                onPressed: () => _handleNumber(2),
                                child: new Text(
                                  '2',
                                  textScaleFactor: keypadScaleFactor,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: keypadWeight),
                                ),
                              ),
                              new FlatButton(
                                onPressed: () => _handleNumber(3),
                                child: new Text(
                                  '3',
                                  textScaleFactor: keypadScaleFactor,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: keypadWeight),
                                ),
                              ),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  onPressed: () => _handleNumber(4),
                                  child: new Text(
                                    '4',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                              new FlatButton(
                                  onPressed: () => _handleNumber(5),
                                  child: new Text(
                                    '5',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                              new FlatButton(
                                  onPressed: () => _handleNumber(6),
                                  child: new Text(
                                    '6',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  onPressed: () => _handleNumber(7),
                                  child: new Text(
                                    '7',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                              new FlatButton(
                                  onPressed: () => _handleNumber(8),
                                  child: new Text(
                                    '8',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                              new FlatButton(
                                  onPressed: () => _handleNumber(9),
                                  child: new Text(
                                    '9',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  onPressed: () => _handleNumber(0),
                                  child: new Text(
                                    '0',
                                    textScaleFactor: keypadScaleFactor,
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: keypadWeight),
                                  )),
                              new FlatButton(
                                  onPressed: _handleBackspace,
                                  child: new Icon(
                                    Icons.backspace,
                                    size: 50.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      )),
                  new Container(
                    color: Colors.black26,
                    child: new Column(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () => _handleOperation(operation.SUB),
                            child: new Text(
                              '-',
                              textScaleFactor: operationScaleFactor,
                              style: new TextStyle(color: Colors.white),
                            )),
                        new FlatButton(
                            onPressed: () => _handleOperation(operation.ADD),
                            child: new Text(
                              '+',
                              textScaleFactor: operationScaleFactor,
                              style: new TextStyle(color: Colors.white),
                            )),
                        new FlatButton(
                            onPressed: () => _handleOperation(operation.MUL),
                            child: new Text(
                              '×',
                              textScaleFactor: operationScaleFactor,
                              style: new TextStyle(color: Colors.white),
                            )),
                        new FlatButton(
                            onPressed: () => _handleOperation(operation.DIV),
                            child: new Text(
                              '÷',
                              textScaleFactor: operationScaleFactor,
                              style: new TextStyle(color: Colors.white),
                            )),
                        new FlatButton(
                            onPressed: _handleEquals,
                            child: new Text(
                              '=',
                              textScaleFactor: operationScaleFactor,
                              style: new TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
