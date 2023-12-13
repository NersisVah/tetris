import 'package:flutter/material.dart';
import 'package:my_tetris_game/constant.dart';
import 'package:my_tetris_game/tetris_game_screen.dart';
import 'package:my_tetris_game/tetris_logo.dart';

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff31188c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child:TetrisLogo()),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TetrisPage()));
          }, child: Text('PLAY TETRIS',style: kTextStyle.copyWith(color: Color(
              0xffd1ccee))))
        ],
      ),

    );
  }
}
