import 'package:flutter/material.dart';

import '../shape.dart';

class ShapeL extends Shape {
  List<int> singlePixelList = [7,12,17,18];
  int rotateCount = 0;
  ShapeL() {
    // pixelList = [3, 13, 4, 5];
    pixelList = [4, 14, 24, 25];
    color = Colors.tealAccent;image = AssetImage('images/new/green1.jpg');
  }

  @override
  void rotateShape() {
    switch (rotateCount) {
      case 0:
        {
          pixelList[2] = pixelList[0] + 1;
          pixelList[3] = pixelList[0] + 2;
          rotateCount ++;
        } break;
      case 1:
        {
          pixelList[1] = pixelList[0] + 11;
          pixelList[3] = pixelList[0] + 21;
          rotateCount ++;
        } break;
      case 2:
        {
          pixelList[1] = pixelList[0] - 10;
          pixelList[3] = pixelList[0] + 2;
          rotateCount++;
        } break;
      case 3:
        {
          // pixelList[0] = pixelList[0] - 1;
          pixelList[1] = pixelList[0] + 10;
          pixelList[2] = pixelList[0] + 20;
          pixelList[3] = pixelList[0] + 21;
          rotateCount  = 0;
        } break;
    }
  }
}