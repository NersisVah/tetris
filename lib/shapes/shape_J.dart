import 'package:flutter/material.dart';

import 'abstract_shape/shape.dart';

class ShapeJ extends Shape {
  List<int> singlePixelList = [16,17,12,7];
  int rotateCount = 0;
  ShapeJ() {
    pixelList = [24, 25, 15, 5];
    color = Colors.yellow;image = AssetImage('images/new/blue1.jpg');
  }

  @override
  void rotateShape() {
    switch (rotateCount) {
      case 0:
        {
          //26 , 25, 15 ,27
          pixelList[0] = pixelList[1] + 1;
          pixelList[3] = pixelList[1] + 2;
          rotateCount ++;
        } break;
      case 1:
        {
          // 26 25  15 27
          pixelList[0] = pixelList[1] - 11;
          pixelList[3] = pixelList[1] + 10;
          rotateCount ++;
        } break;
      case 2:
        {
          pixelList[0] = pixelList[1] + 9;
          rotateCount  = 0;
        } break;
    }
  }
}