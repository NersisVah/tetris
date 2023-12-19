import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/Screens/newScreen/shape.dart';
import 'package:my_tetris_game/piece.dart';
import 'package:my_tetris_game/pixel.dart';
import 'package:my_tetris_game/values.dart';

import 'commonValues.dart';

List<int> rowList = [0,0,0,0,0,0,0,0,0,0];
List<List<int>> gameBoard1 = List.generate(15, (index) => [0,0,0,0,0,0,0,0,0,0]);


class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Shape currentShape = ShapeL();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  void startGame(int milis){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        title: Center(
            child: Text(
          'TETRIS GAME',
        )),
      ),
      body: GestureDetector(
        onDoubleTap: (){
          currentShape.moveRight();
          setState(() {

          });
        },
        onTap: (){
          currentShape.moveLeft();
          setState(() {

          });
        },


        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rowLength * columnLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: rowLength),
          itemBuilder: (context, int index) {
            if(currentShape.pixelList.contains(index))  {
              return Pixel(color: currentShape.color, child: '');
            }
            // int row = (index / rowLength).floor();
            // int col = index % rowLength;
            // if (currentPiece.position.contains(index)) {
            //   return Pixel(
            //     color: Colors.yellow,
            //     child: index.toString(),
            //   );
            // }

            // else if (gameBoard1[row][col] != 0) {
            //   return Pixel(
            //     color: Colors.greenAccent,
            //     child: '',
            //   );
            // }

            // else
              return Pixel(
                color: Colors.grey[900],
                child: index.toString(),
              );
          },
        ),
      ),
    );
  }
}
