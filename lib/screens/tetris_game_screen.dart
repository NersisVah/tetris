import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/piece.dart';
import 'package:my_tetris_game/pixel.dart';
import 'package:my_tetris_game/values.dart';

List<int> rowList = [0,0,0,0,0,0,0,0,0,0];
List<List<int>> gameBoard1 = List.generate(15, (index) => [0,0,0,0,0,0,0,0,0,0]);


class GameBoard extends StatefulWidget {
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // int count = 0;
  Piece currentPiece = Piece(type: Tetromino.Z);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startGame();
    print('game started');
  }

  void startGame() {
    Duration duration = Duration(milliseconds: 400);
    currentPiece.initializePiece();
    gameLoop(duration);
  }

  void gameLoop(Duration frameRate){
    Timer.periodic(frameRate, (timer) {
      setState(() {
        checkLanding();
        currentPiece.moviePiece(Direction.down);

      });
    });
  }

  bool checkCollusion(Direction direction) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      int row = (currentPiece.position[i] / rowLength).floor();
      int col = (currentPiece.position[i] % rowLength).floor();
      if (direction == Direction.left) {
        col--;
      } else if (direction == Direction.right) {
        if(col == rowLength - 1) return true;

      } else if (direction == Direction.down) {
        row ++;
      }
      if (row >= columnLength || col < 0 || col >= rowLength || gameBoard1[row][col] == 1) {
        return true;
      }
    }
    return false;
  }

//check going down is occupied
  void checkLanding() {
    if (checkCollusion(Direction.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLength).floor();
        int col = (currentPiece.position[i] % rowLength).floor();
        if(row >= 0 && col >= 0){
        gameBoard1[row][col] = 1;}
      }
      createNewPeace();
    }
  }

  void createNewPeace() {
    Random rand = Random();
    Tetromino randomType = Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();
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
        onTap: (){
          currentPiece.moviePiece(Direction.left);
        },
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rowLength * columnLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: rowLength),
          itemBuilder: (context, int index) {
            int row = (index / rowLength).floor();
            int col = index % rowLength;
            if (currentPiece.position.contains(index)) {
              return Pixel(
                color: Colors.yellow,
                child: index.toString(),
              );
            }

            else if (gameBoard1[row][col] != 0) {
              return Pixel(
                color: Colors.greenAccent,
                child: '',
              );
            }

            else
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
