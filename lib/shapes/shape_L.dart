import 'package:flutter/material.dart';

import 'abstract_shape/shape.dart';

class ShapeL extends Shape {
  List<int> singlePixelList = [7,12,17,18];
  int rotateCount = 0;
  ShapeL() {

    pixelList = [4, 14, 24, 25];
    image = AssetImage('images/new/green1.jpg');
  }

  bool hasRotate(List<List<Map<ImageProvider?, int>>> myGameBoard){
    for (int i = 0; i < pixelList.length; i++) {
      int row = (pixelList[i] / 10).floor();
      int col = pixelList[i] % 10;
      int next1DangerRow = (row == 14) ? 14 :row + 1;
      int next2DangerRow = (row == 13) ? 14 :row + 2;
      int next1DangerCol = (col == 9) ? 9 : col + 1;
      int next2DangerCol = (col == 8) ? 9 : col + 2;
      int previous1DangerCol = (col == 0) ? 0 : col - 1;
      int previous2DangerCol = (col == 1) ? 0 : col - 2;
      if(col == 9){return false;}
      else if (myGameBoard[next1DangerRow][col].containsValue(1)) {
        return true;
      }
      else if (myGameBoard[next2DangerRow][col].containsValue(1)) {
        return true;
      }
      else if (myGameBoard[row][previous1DangerCol].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[row][previous2DangerCol].containsValue(1)) {
        return true;
      }*/
      else if (myGameBoard[row][next1DangerCol].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[row][next2DangerCol].containsValue(1)) {
        return true;
      }*/
      else if (next1DangerRow >= 15 || row == 0){
        return true;}
      else if (next2DangerRow >= 15 || row == 0) {return true;}
    }
    return false;
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
          pixelList[0] = pixelList[0] + 10;
          pixelList[1] = pixelList[0] + 1;
          pixelList[2] = pixelList[0] + 2;
          pixelList[3] = pixelList[0] - 8;
          rotateCount++;
        } break;
      case 3:
        {
          // pixelList[0] = pixelList[0] - 1;
          pixelList[0] = pixelList[0] - 10;
          pixelList[1] = pixelList[0] + 10;
          pixelList[2] = pixelList[0] + 20;
          pixelList[3] = pixelList[0] + 21;
          rotateCount  = 0;
        } break;
    }
  }
}