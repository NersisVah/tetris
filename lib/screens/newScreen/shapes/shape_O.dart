import 'package:flutter/material.dart';

import '../shape.dart';

class ShapeO extends Shape {
  List<int> singlePixelList = [11, 12,16,17];
  ShapeO() {
    pixelList = [4, 5, 14, 15];
    color = Colors.pinkAccent;image = AssetImage('images/new/green3.jpg');
  }

  @override
  void rotateShape() {
    // TODO: implement rotateShape
  }
}