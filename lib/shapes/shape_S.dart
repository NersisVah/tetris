import 'package:flutter/material.dart';

import 'abstract_shape/shape.dart';

class ShapeS extends Shape {
  List<int> singlePixelList = [11,12,7,8];
  bool _hasRotate = false;
  ShapeS() {
    pixelList = [13, 14, 4, 5];
    image = AssetImage('images/new/orange1.jpg');
  }

  @override
  void rotateShape() {
    if (!_hasRotate){
      pixelList[3] = pixelList[1] + 10;
      pixelList[2] = pixelList[1] - 11;
      _hasRotate = true;
    }else{
      pixelList[2] = pixelList[1] - 10;
      pixelList[3] = pixelList[1] - 9;
      _hasRotate = false;
    }

  }

  @override
  bool hasRotate(List<List<Map<ImageProvider?, int>>> myGameBoard) {
    // TODO: implement hasRotate
    return true;
  }


}