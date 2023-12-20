import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_tetris_game/main/constant.dart';
import 'package:my_tetris_game/shapes/abstract_shape/shape.dart';
import 'package:my_tetris_game/pixel/pixel.dart';
import 'package:my_tetris_game/shapes/shape_T.dart';
import 'package:my_tetris_game/screens/start_screen.dart';
import 'package:my_tetris_game/values.dart';
import '../../logic/game_logic.dart';
import 'commonValues.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

//Create class Game (nextShape,currentShape, gameScore)
class _GameScreenState extends State<GameScreen> {
  Game game = Game(duration: Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    startGame(game.duration);
  }

  void startGame(Duration duration) {
    Timer.periodic(duration, (timer) {
      setState(() {
        game.getCurrentShape().moveDown();
        bool gameIsReturn = game.drawShapeAndCreateNewShape();
        if (!gameIsReturn) {
          timer.cancel();
          showGameOverDialog();
        }
      });
    });
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
                'Your Score is' + game.getGameScore().toString(),
                textAlign: TextAlign.end,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      resetGame();
                    });
                  },
                  child: Text('PLAY AGAIN'),
                )
              ],
            ));
  }

  void resetGame() {
    game.reset();
    Navigator.pop(context);
    Navigator.push(context , MaterialPageRoute(builder: (context) => GameScreen()));
  }

  bool hasRotateCollision() {
    for (int i = 0; i < game.getCurrentShape().pixelList.length; i++) {
      int row = (game.getCurrentShape().pixelList[i] / rowLength).floor();
      int col = game.getCurrentShape().pixelList[i] % rowLength;
      int next1DangerRow = (row == 14) ? 14 : row + 1;
      int next2DangerRow = (row == 13) ? 14 : row + 2;
      int next1DangerCol = (col == 9) ? 9 : col + 1;
      int next2DangerCol = (col == 8) ? 9 : col + 2;
      int previous1DangerCol = (col == 0) ? 0 : col - 1;
      int previous2DangerCol = (col == 1) ? 0 : col - 2;

      if (col == 9) {
        return true;
      } else if (col == 0) {
        return true;
      } else if (game.getMyGameBoard()[next1DangerRow][col].containsValue(1)) {
        return true;
      }
      else if (game
          .getMyGameBoard()[row][previous1DangerCol]
          .containsValue(1)) {
        return true;
      }
      else if (game.getMyGameBoard()[row][next1DangerCol].containsValue(1)) {
        return true;
      }
      else if (next1DangerRow >= 15 || row == 0)
        return true;
      else if (next2DangerRow >= 15 || row == 0) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/backgroundRain.jpeg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageButton(
                        image: AssetImage('images/wallpaper.jpg'),
                        onPress: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.home,
                                size: 50,
                              ),
                              Text('HOME',
                                  style: kTextStyle.copyWith(fontSize: 26))
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
                              constraints: BoxConstraints(
                                maxWidth: 85,
                              ),
                              child: GridView.builder(
                                itemCount: 25,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  if (game
                                      .getNextShape()
                                      .singlePixelList
                                      .contains(index)) {
                                    return Pixel(
                                      image: game.getNextShape().image,
                                    );
                                  } else {
                                    return Pixel(
                                      image: AssetImage('images/back1.jpg'),
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
                      image: AssetImage('images/backgroundRain.jpeg'),
                      onPress: () {
                        resetGame();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'TRY',
                            style: kTextStyle.copyWith(fontSize: 26),
                          ),
                          Icon(
                            Icons.restart_alt,
                            size: 50,
                          ),
                          Text('AGAIN',
                              style: kTextStyle.copyWith(fontSize: 26))
                        ],
                      ),
                    ),
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
                        if (game.getCurrentShape().pixelList.contains(index)) {
                          return Pixel(
                            image: game.getCurrentShape().image,
                          );
                        } else if (game
                            .getMyGameBoard()[row][col]
                            .containsValue(1)) {
                          return Pixel(
                            image: game.getMyGameBoard()[row][col].keys.first!,
                          );
                        } else {
                          return Pixel(
                            image:
                                AssetImage('images/new/bacground_tetris.jpg'),
                          );
                        }
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: GestureDetector(onTap: () {
                          setState(() {
                            if (!game.hasCollisionLeft()) {
                              game.getCurrentShape().moveLeft();
                            }
                          });
                        })),
                        Expanded(
                          child: GestureDetector(onTap: () {
                            setState(() {
                              if (!hasRotateCollision()) {
                                game.getCurrentShape().rotateShape();
                              }
                            });
                            // });
                          }),
                        ),
                        Expanded(child: GestureDetector(onTap: () {
                          setState(() {
                            if (!game.hasCollusionRight()) {
                              game.getCurrentShape().moveRight();
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
                    image: DecorationImage(
                        image: AssetImage('images/12345.avif'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Text(
                    'Score : ' + game.getGameScore().toString(),
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
