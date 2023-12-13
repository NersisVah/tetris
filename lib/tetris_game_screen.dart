import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/piece.dart';
import 'package:my_tetris_game/pixel.dart';
import 'package:my_tetris_game/values.dart';

class TetrisPage extends StatefulWidget {
  @override
  State<TetrisPage> createState() => _TetrisPageState();
}

class _TetrisPageState extends State<TetrisPage> {
  int count = 0;

  List<Piece> listPieces = [
  Piece(type: Tetromino.S),
  Piece(type: Tetromino.S),
  ];
  int currentpieceIndex = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startGame();
    print('game started');
  }

  void startGame(){
    listPieces[currentpieceIndex].initializePiece();
    Timer.periodic(Duration(milliseconds: 500) , (Timer timer){
      setState(() {
        listPieces[currentpieceIndex].moviePiece(Direction.down);
        if(listPieces[currentpieceIndex].position.contains(144)){timer.cancel();count++;listPieces[count].initializePiece();}
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: GestureDetector(
        onTap: (){
          setState(() {
            print(1);
            listPieces[currentpieceIndex].moviePiece(Direction.down);
          });
        },
        child: GridView.builder(
          physics:  NeverScrollableScrollPhysics(),
          itemCount: rowLength * columnLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowLength),
          itemBuilder: (BuildContext context, int index) {
            if(listPieces[currentpieceIndex].position.contains(index)){
              return Pixel(color: Colors.yellow,child: index.toString(),);
            }else return Pixel(color: Colors.grey[900] , child: index.toString(),);
            },
        ),
      ),


    );
  }
}
