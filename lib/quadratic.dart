import 'dart:math';

import 'package:flutter/material.dart';

class QuadraticFormula extends StatefulWidget {
  QuadraticFormula({Key key}) : super(key: key);

  @override
  QuadraticFormulaState createState() => new QuadraticFormulaState();
}

class QuadraticFormulaState extends State<QuadraticFormula> {
  final _formKey = GlobalKey<FormState>();
  FormulaValues formulaValues = new FormulaValues();
  double result1 = 0.0;
  double result2 = 0.0;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null ||
        int.parse(s, onError: (e) => null) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Color(0xFF484848),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'a',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(12.0)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!isNumeric(value)) {
                    return 'Please enter a valid number';
                  }
                },
                onSaved: (val) => formulaValues.a = double.parse(val),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                style: TextStyle(color: Colors.white),
              ),
            ),
            ConstrainedBox(constraints: const BoxConstraints(minHeight: 9.0)),
            Container(
              color: Color(0xFF484848),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'b',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(12.0)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!isNumeric(value)) {
                    return 'Please enter a valid number';
                  }
                },
                onSaved: (val) => formulaValues.b = double.parse(val),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                style: TextStyle(color: Colors.white),
              ),
            ),
            ConstrainedBox(constraints: const BoxConstraints(minHeight: 9.0)),
            Container(
              color: Color(0xFF484848),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'c',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(12.0)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!isNumeric(value)) {
                    return 'Please enter a valid number';
                  }
                },
                onSaved: (val) => formulaValues.c = double.parse(val),
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                style: TextStyle(color: Colors.white),
              ),
            ),
            ConstrainedBox(constraints: const BoxConstraints(minHeight: 9.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(minWidth: 170.0, minHeight: 36.0),
                  color: Color(0xFF616161),
                  child: Center(
                    child: Text(result1.toString()),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 170.0, minHeight: 36.0),
                  color: Color(0xFF616161),
                  child: Center(
                    child: Text(result2.toString()),
                  ),
                ),
              ],
            ),
            Image(
              image: AssetImage('assets/qformula.png'),
            ),
            Spacer(flex: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
                      _formKey.currentState.save();

                      setState(() {
                        result1 = (-formulaValues.b +
                                sqrt(pow(formulaValues.b, 2) -
                                    4 * formulaValues.a * formulaValues.c)) /
                            (2 * formulaValues.a);

                        result2 = (-formulaValues.b -
                            sqrt(pow(formulaValues.b, 2) -
                                4 * formulaValues.a * formulaValues.c)) /
                            (2 * formulaValues.a);
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormulaValues {
  double a;
  double b;
  double c;
}
