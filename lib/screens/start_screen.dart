import 'package:flutter/material.dart';
import 'package:my_tetris_game/Screens/newScreen/my_tetris_game_screen.dart';
import 'package:my_tetris_game/constant.dart';
import 'package:my_tetris_game/Screens/tetris_game_screen.dart';
import 'package:my_tetris_game/tetris_logo.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/wallpaper.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: TetrisLogo()),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'G',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'A',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'M',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'E',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ImageButton('Level'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ImageButton('start game'),
            SizedBox(
              height: 20,
            ),
            ImageButton('score'),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String string;

  ImageButton(this.string);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage('images/tet.jpeg'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GameScreen()));
          },
          child: Text(
            string.toUpperCase(),
            textAlign: TextAlign.center,
            style: kTextStyle,
          ),
        ),
      ),
    );
  }
}
