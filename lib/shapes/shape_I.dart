import 'package:flutter/material.dart';
import 'package:my_tetris_game/values.dart';

import 'abstract_shape/shape.dart';

class ShapeI extends Shape {
  List<int> singlePixelList = [7, 12, 17, 22];
  bool isRotate = false;

  ShapeI() {
    pixelList = [4, 14, 24, 34];
    // color = Colors.blueAccent;
    image = AssetImage('images/new/blue1.jpg');
  }

  void rotateShape() {
    if (!isRotate) {
      print(pixelList[1] % rowLength);
      if (pixelList[1] % rowLength > 7 || pixelList[1] % rowLength == 0) {
        // N O P
      } else {
        pixelList[0] = pixelList[1] - 1;
        pixelList[2] = pixelList[1] + 1;
        pixelList[3] = pixelList[1] + 2;
        isRotate = true;
        print(isRotate);
      }
    }
    else {
      pixelList[0] = pixelList[1] - 10;
      pixelList[2] = pixelList[1] + 10;
      pixelList[3] = pixelList[1] + 20;
      isRotate = false;
    }
  }

  @override
  bool hasRotate(List<List<Map<ImageProvider?, int>>> myGameBoard) {
    // TODO: implement hasRotate
    return true;
  }
}