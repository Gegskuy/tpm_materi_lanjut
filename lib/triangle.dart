import 'dart:math';

import 'package:flutter/material.dart';

class TriangleCalculator extends StatefulWidget {
  @override
  _TriangleCalculatorState createState() => _TriangleCalculatorState();
}

class _TriangleCalculatorState extends State<TriangleCalculator> {
  TextEditingController side1Controller = TextEditingController();
  TextEditingController side2Controller = TextEditingController();
  TextEditingController side3Controller = TextEditingController();

  double area = 0.0;
  double circumference = 0.0;

  void calculate() {
    double a = double.tryParse(side1Controller.text) ?? 0.0;
    double b = double.tryParse(side2Controller.text) ?? 0.0;
    double c = double.tryParse(side3Controller.text) ?? 0.0;

    double s = (a + b + c) / 2; // semi-perimeter
    area = sqrt(s * (s - a) * (s - b) * (s - c));
    circumference = a + b + c;

    setState(() {}); // update UI with calculated values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangle Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: side1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter side 1'),
            ),
            TextField(
              controller: side2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter side 2'),
            ),
            TextField(
              controller: side3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter side 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Area: $area',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Circumference: $circumference',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}