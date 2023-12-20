import 'package:flutter/material.dart';

import 'abstract_shape/shape.dart';

class ShapeZ extends Shape {
  List<int> singlePixelList = [6,7,12,13];
  bool _hasRotate = false;

  ShapeZ() {
    pixelList = [4, 5, 15, 16];
    color = Colors.white;
    image = AssetImage('images/new/red2.jpg');
    // image = AssetImage('images/yellow.png');
  }

  @override
  void rotateShape() {
    if (!_hasRotate) {
      pixelList[2] = pixelList[1] + 9;
      pixelList[3] = pixelList[1] - 10;
      _hasRotate = true;
    } else {
      pixelList[2] = pixelList[1]  + 10;
      pixelList[3] = pixelList[1] + 11 ;
      _hasRotate = false;
    }
  }

  @override
  bool hasRotate(List<List<Map<ImageProvider?, int>>> myGameBoard) {
    // TODO: implement hasRotate
    return true;
  }
}
