import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/logic/shape_builder.dart';
import 'package:my_tetris_game/shapes/abstract_shape/shape.dart';
import 'package:my_tetris_game/shapes/shape_I.dart';
import 'package:my_tetris_game/shapes/shape_T.dart';

import '../shapes/shape_J.dart';
import '../shapes/shape_L.dart';
import '../shapes/shape_O.dart';
import '../shapes/shape_S.dart';
import '../shapes/shape_Z.dart';

class Game {
  final _rowLength = 10;
  final _colLength = 15;
  int _gameScore = 0;
  Shape _currentShape = ShapeL();
  Shape _nextShape = ShapeT();
  int _randomInt = 0;
  List<List<Map<ImageProvider?, int>>> _myGameBoard = List.generate(
      15,
      (index) => [
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
            {null: 0},
          ]);

  Duration duration;

  Game({required this.duration});

  int getRandomInt() => _randomInt;

  int getGameScore() => _gameScore;

  Shape getCurrentShape() => _currentShape;

  Shape getNextShape() => _nextShape;

  List<List<Map<ImageProvider?, int>>> getMyGameBoard() => _myGameBoard;

  // void startGame(){
  //   Timer.periodic(duration, (timer) {
  //     _currentShape.moveDown();
  //     bool gameIsReturn = drawShapeAndCreateNewShape();
  //     if (!gameIsReturn) {
  //       timer.cancel();
  //     }
  //
  //   });
  // }

  bool hasCollusionDown() {
    for (int i = _currentShape.pixelList.length - 1; i >= 0; i--) {
      int row = (_currentShape.pixelList[i] / _rowLength).floor();
      int col = (_currentShape.pixelList[i] % _rowLength).floor();
      int nextRow = row + 1;
      if (nextRow >= 15 || _myGameBoard[nextRow][col].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  bool hasCollisionLeft() {
    for (int i = 0; i < _currentShape.pixelList.length; i++) {
      int row = (_currentShape.pixelList[i] / _rowLength).floor();
      int col = _currentShape.pixelList[i] % _rowLength;
      int previousCol = col != 0 ? col - 1 : 0;
      if (_myGameBoard[row][previousCol].containsValue(1)) {
        return true;
      }
      if (_myGameBoard[row + 1][previousCol].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  bool hasCollusionRight() {
    for (int i = 0; i < _currentShape.pixelList.length; i++) {
      int row = (_currentShape.pixelList[i] / _rowLength).floor();
      int col = _currentShape.pixelList[i] % _rowLength;
      int nextCol = (col != 9 ? col + 1 : 9);
      if (_myGameBoard[row][nextCol].containsValue(1)) {
        return true;
      }
      if (_myGameBoard[row + 1][nextCol].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  bool hasRotateCollision() {
    for (int i = 0; i < _currentShape.pixelList.length; i++) {
      int row = (_currentShape.pixelList[i] / _rowLength).floor();
      int col = _currentShape.pixelList[i] % _rowLength;
      int next1DangerRow = row + 1;
      int next2DangerRow = row + 2;
      int next1DangerCol = col + 1;
      int next2DangerCol = col + 2;
      int previous1DangerCol = col - 1;
      int previous2DangerCol = col - 2;
      if(col == 0 || col == 9){
        return true;
      }
      else if (_myGameBoard[next1DangerRow][col].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[next2DangerRow][col].containsValue(1)) {
        return true;
      }*/
      else if (_myGameBoard[row][previous1DangerCol].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[row][previous2DangerCol].containsValue(1)) {
        return true;
      }*/
      else if (_myGameBoard[row][next1DangerCol].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[row][next2DangerCol].containsValue(1)) {
        return true;
      }*/
      else if (next1DangerRow >= 15 || row == 0)
        return true;
      else if (next2DangerRow >= 15 || row == 0) return true;
    }
    return false;
  }

  bool drawShapeAndCreateNewShape() {
    Random random = Random();
    if (hasCollusionDown()) {
      for (int i = 0; i < _currentShape.pixelList.length; i++) {
        int row = (_currentShape.pixelList[i] / _rowLength).floor();
        int col = _currentShape.pixelList[i] % _rowLength;
        Map<ImageProvider, int> map = {_currentShape.image: 1};
        // for (int i = 0; i < _myGameBoard.length; i++) { }
        _myGameBoard[row][col] = map;
      }
      if (!isGameOver()) {
        createNewShape(_randomInt);
        _randomInt = random.nextInt(7);
        createNextShape(_randomInt);
        checkLineIsFull();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  void createNewShape(int randomInt) {
    switch (randomInt) {
      case 0:
        {
          _currentShape = ShapeT();
        }
        break;
      case 1:
        {
          _currentShape = ShapeJ();
        }
        break;
      case 2:
        {
          _currentShape = ShapeI();
        }
        break;
      case 3:
        {
          _currentShape = ShapeO();
        }
        break;
      case 4:
        {
          _currentShape = ShapeL();
        }
        break;
      case 5:
        {
          _currentShape = ShapeS();
        }
        break;
      case 6:
        {
          _currentShape = ShapeZ();
        }
        break;
    }
  }

  void createNextShape(int i) {
    switch (i) {
      case 0:
        {
          _nextShape = ShapeT();
        }
        break;
      case 1:
        {
          _nextShape = ShapeJ();
        }
        break;
      case 2:
        {
          _nextShape = ShapeI();
        }
        break;
      case 3:
        {
          _nextShape = ShapeO();
        }
        break;
      case 4:
        {
          _nextShape = ShapeL();
        }
        break;
      case 5:
        {
          _nextShape = ShapeS();
        }
        break;
      case 6:
        {
          _nextShape = ShapeZ();
        }
        break;
    }
  }

  bool isGameOver() {
    if (_myGameBoard[1][4].containsValue(1)) {
      return true;
    } else {
      return false;
    }
  }

  void checkLineIsFull() {
    int count = 0;
    for (int i = 0; i < _myGameBoard.length; i++) {
      for (int j = 0; j < _myGameBoard[i].length; j++) {
        if (_myGameBoard[i][j].values.first == 1) {
          count++;
          print('row is $i : count is $count');
        }

        if (count == 10) {
          _myGameBoard[i] = [
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
            {AssetImage('images/new/full.jpg'): 1},
          ];
          Timer timer = Timer(Duration(milliseconds: 400), () {
            for (int k = i; i > 0; i--) {
              print(' ------------------------------------------------------count $count  isss');
              _myGameBoard[i] = _myGameBoard[i - 1];
              _myGameBoard[0] = [
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
                {null: 0},
              ];
            }
          });

          _gameScore += 10;
        }
      }
      count = 0;
    }
  }

  void reset() {
    _gameScore = 0;
    _myGameBoard = List.generate(
        15,
        (index) => [
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
              {null: 0},
            ]);
  }
}
