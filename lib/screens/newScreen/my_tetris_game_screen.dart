import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/main/constant.dart';
import 'package:my_tetris_game/shapes/abstract_shape/shape.dart';
import 'package:my_tetris_game/pixel/pixel.dart';
import 'package:my_tetris_game/shapes/shape_I.dart';
import 'package:my_tetris_game/shapes/shape_T.dart';
import 'package:my_tetris_game/shapes/shape_J.dart';
import 'package:my_tetris_game/shapes/shape_O.dart';
import 'package:my_tetris_game/shapes/shape_S.dart';
import 'package:my_tetris_game/shapes/shape_Z.dart';
import 'package:my_tetris_game/shapes/shape_L.dart';
import 'package:my_tetris_game/screens/start_screen.dart';
import 'package:my_tetris_game/values.dart';
import 'commonValues.dart';

int randomInt = 0;
List<List<Map<ImageProvider?, int>>> myGameBoard = List.generate(
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

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}


//Create class Game (nextShape,currentShape, gameScore)
class _GameScreenState extends State<GameScreen> {
  // Game game=new Game()
  Shape nextShape = ShapeT();
  Shape currentShape = ShapeT();
  int gameScore = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startGame(duration);
  }

  void startGame(Duration duration) {
    Timer.periodic(duration, (timer) {
      setState(() {
        currentShape.moveDown();
        bool gameIsReturn = drawShapeAndCreateNewShape();
        if (!gameIsReturn) {
          timer.cancel();
          showGameOverDialog();
        }
      });
    });
  }

  bool drawShapeAndCreateNewShape() {
    Random random = Random();
    if (hasCollusionDown()) {
      for (int i = 0; i < currentShape.pixelList.length; i++) {
        int row = (currentShape.pixelList[i] / rowLength).floor();
        int col = currentShape.pixelList[i] % rowLength;
        Map<ImageProvider, int> map = {currentShape.image: 1};
        myGameBoard[row][col] = map;
      }
      if (!isGameOver()) {
        createNewShape(randomInt);
        randomInt = random.nextInt(7);
        createNextShape(randomInt);
        checkLineIsFull();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  void showGameOverDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Game Over',
                style: kTextStyle,
              ),
              content: Text(
                'Your Score is $gameScore',
                textAlign: TextAlign.end,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      resetGame();
                      Navigator.pop(context);
                    });
                  },
                  child: Text('PLAY AGAIN'),
                )
              ],
            ));
  }

  void resetGame() {
    gameScore = 0;
    myGameBoard = List.generate(
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
    startGame(duration);
  }

  void resetGameWithButton(){
    gameScore = 0;
    myGameBoard = List.generate(
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

  bool hasCollusionRight() {
    for (int i = 0; i < currentShape.pixelList.length; i++) {
      int row = (currentShape.pixelList[i] / rowLength).floor();
      int col = currentShape.pixelList[i] % rowLength;
      int nextCol = col != 9 ? col + 1 : 9;
      if (myGameBoard[row][nextCol].containsValue(1)) {
        return true;
      }
      if (myGameBoard[row + 1][nextCol].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  void createNextShape(int i) {
    switch (i) {
      case 0:
        {
          nextShape = ShapeT();
        }
        break;
      case 1:
        {
          nextShape = ShapeJ();
        }
        break;
      case 2:
        {
          nextShape = ShapeI();
        }
        break;
      case 3:
        {
          nextShape = ShapeO();
        }
        break;
      case 4:
        {
          nextShape = ShapeL();
        }
        break;
      case 5:
        {
          nextShape = ShapeS();
        }
        break;
      case 6:
        {
          nextShape = ShapeZ();
        }
        break;
    }
  }

  bool hasRotateCollision() {
    for (int i = 0; i < currentShape.pixelList.length; i++) {
      int row = (currentShape.pixelList[i] / rowLength).floor();
      int col = currentShape.pixelList[i] % rowLength;
      int next1DangerRow = row + 1;
      int next2DangerRow = row + 2;
      int next1DangerCol = col + 1;
      int next2DangerCol = col + 2;
      int previous1DangerCol = col - 1;
      int previous2DangerCol = col - 2;

      if (myGameBoard[next1DangerRow][col].containsValue(1)) {
        return true;
      }
      /*else if (myGameBoard[next2DangerRow][col].containsValue(1)) {
        return true;
      }*/
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
      else if (next1DangerRow >= 15 || row == 0)
        return true;
      else if (next2DangerRow >= 15 || row == 0) return true;
    }
    return false;
  }

  bool hasCollisionLeft() {
    for (int i = 0; i < currentShape.pixelList.length; i++) {
      int row = (currentShape.pixelList[i] / rowLength).floor();
      int col = currentShape.pixelList[i] % rowLength;
      int previousCol = col != 0 ? col - 1 : 0;
      if (myGameBoard[row][previousCol].containsValue(1)) {
        return true;
      }
      if (myGameBoard[row + 1][previousCol].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  bool hasCollusionDown() {
    for (int i = currentShape.pixelList.length - 1; i >= 0; i--) {
      int row = (currentShape.pixelList[i] / rowLength).floor();
      int col = (currentShape.pixelList[i] % rowLength).floor();
      int nextRow = row + 1;

      if (nextRow >= 15 || myGameBoard[nextRow][col].containsValue(1)) {
        return true;
      }
    }
    return false;
  }

  void checkLineIsFull() {
    int count = 0;
    for (int i = 0; i < myGameBoard.length; i++) {
      for (int j = 0; j < myGameBoard[i].length; j++) {
        if (myGameBoard[i][j].values.first == 1) {
          count++;
          print('row is $i count is $count');
        }
        if (count == 10) {
          myGameBoard[i] = [
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
              for(int k = i ; i > 0 ; i--){
                myGameBoard[i] = myGameBoard[i - 1];
              }

          });
          // while (i != 0) {
          //   myGameBoard[i] = myGameBoard[i - 1];
            // i--;
          // }
          gameScore += 10;
        }
      }
      count = 0;
    }
  }

  void createNewShape(int randomInt) {
    //TODO move to other class, ShapeBuilder
    switch (randomInt) {
      case 0:
        {
          currentShape = ShapeT();
        }
        break;
      case 1:
        {
          currentShape = ShapeJ();
        }
        break;
      case 2:
        {
          currentShape = ShapeI();
        }
        break;
      case 3:
        {
          currentShape = ShapeO();
        }
        break;
      case 4:
        {
          currentShape = ShapeL();
        }
        break;
      case 5:
        {
          currentShape = ShapeS();
        }
        break;
      case 6:
        {
          currentShape = ShapeZ();
        }
        break;
    }
  }

  bool isGameOver() {
    if (myGameBoard[1][4].containsValue(1)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xF131313),
      // appBar: AppBar(
      //   title: Center(
      //       child: Text(
      //     'TETRIS GAME',
      //   )),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/tb.jpeg'), fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageButton(
                          image: AssetImage('images/wallpaper.jpg'),
                          onPress: () { Navigator.pop(context); },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.home,size: 50,),
                                Text('HOME', style: kTextStyle.copyWith(fontSize: 26))
                              ],
                            ),
                          )),

                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'NEXT',
                                style: kTextStyle.copyWith(fontSize: 26),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 85,),
                              child: GridView.builder(
                                itemCount: 25,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  if (nextShape.singlePixelList
                                      .contains(index)) {
                                    return Pixel(
                                      color: nextShape.color, //game.getNextShape()
                                      image: nextShape.image,
                                    );
                                  } else {
                                    return Pixel(
                                      image: AssetImage('images/back1.jpg'),
                                      color: Colors.grey,
                                    );
                                  }
                                },
                              ),

                            ),

                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'TETROMINO',
                              style: kTextStyle.copyWith(fontSize: 20),
                            ),
                          ),

                        ],
                      ),
                    ),
                    ImageButton(
                        image: AssetImage('images/tb.jpeg'),
                        onPress: () {
                          resetGameWithButton();
                        },
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'TRY',
                          style: kTextStyle.copyWith(fontSize: 26),
                        ),
                        Icon(Icons.restart_alt,size: 50,),
                        Text('AGAIN', style: kTextStyle.copyWith(fontSize: 26))
                      ],
                    )),
                  ],
                ),
              ),

              Expanded(
                flex: 25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: rowLength * columnLength,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowLength),
                      itemBuilder: (context, int index) {
                        int row = (index / rowLength).floor();
                        int col = index % rowLength;
                        if (currentShape.pixelList.contains(index)) {
                          return Pixel(
                            image: currentShape
                                .image, /*color: currentShape.color*/
                          );
                        } else if (myGameBoard[row][col].containsValue(1)) {
                          return Pixel(
                            image: myGameBoard[row][col].keys.first!,
                            // color: myGameBoard[row][col].keys.first, child: ''
                          );
                        } else {
                          return Pixel(
                            image: AssetImage('images/new/bacground_tetris.jpg'),
                          );
                        }
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: GestureDetector(onTap: () {
                          setState(() {
                            if (!hasCollisionLeft()) {
                              currentShape.moveLeft();
                            }
                          });
                        })),
                        Expanded(child: GestureDetector(onTap: () {
                          setState(() {
                            if (!hasRotateCollision()) {
                              currentShape.rotateShape();
                            }
                          });
                        })),
                        Expanded(child: GestureDetector(onTap: () {
                          setState(() {
                            if (!hasCollusionRight()) {
                              currentShape.moveRight();
                            }
                          });
                        })),
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                width: 120,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  image: DecorationImage(image: AssetImage('images/12345.avif'),fit: BoxFit.cover)
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Text(
                    'Score : $gameScore',
                    style: kTextStyle.copyWith(fontSize: 45),
                  ))),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
