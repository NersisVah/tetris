import 'dart:ui';
import 'package:my_tetris_game/values.dart';
import 'package:flutter/material.dart';

abstract class Shape {
  Color? color;
  List<int> pixelList = [];

  void moveDown() {
    for (int i = 0; i < pixelList.length; i++) {
      pixelList[i] += 10;
    }
  }

  void moveRight() {
    for (int i = pixelList.length - 1; i >= 0; i--) {
      if (pixelList[i] % rowLength == 9) {
        break;
      } else {
        pixelList[i] += 1;
      }
    }
  }

  void moveLeft() {
    for (int i = 0; i < pixelList.length; i++) {
      if (pixelList[i] % rowLength == 0) {
        break;
      } else {
        pixelList[i] -= 1;
      }
    }
  }
}

class ShapeL extends Shape {
  ShapeL() {
    pixelList = [4, 14, 24, 25];
    color = Colors.red;
  }
}
