import 'package:flutter/material.dart';

import '../shape.dart';

class ShapeT extends Shape {
  List<int> singlePixelList = [7,12,17,13];
  int rotateCount = 0;

  ShapeT() {
    pixelList = [4, 14, 24, 15];
    color = Colors.green;image = AssetImage('images/new/pink.jpg');
  }

  @override
  void rotateShape() {
    
    switch (rotateCount) {
      case 0:
        {
          pixelList[0] = pixelList[1] - 1;
          rotateCount++;
        }
        break;
      case 1:
        {
          pixelList[3] = pixelList[1] - 10;
          rotateCount++;
        }
        break;
      case 2:
        {
          pixelList[2] = pixelList[1] - 10;
          pixelList[3] = pixelList[1] + 1;

          rotateCount++;
        }
        break;
      case 3:
        {
          pixelList[0] = pixelList[1] - 10;
          pixelList[2] = pixelList[1] + 10;
          pixelList[3] = pixelList[1] + 1;
          rotateCount = 0;
        }
        break;
    }
  }
}
