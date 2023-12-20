import 'package:flutter/material.dart';
import 'package:my_tetris_game/screens/newScreen/my_tetris_game_screen.dart';
import 'package:my_tetris_game/main/constant.dart';
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
            ImageButton(
              image: AssetImage('images/tet.jpeg'),
              onPress: () {},
              child: Text(
                'level'.toUpperCase(),
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ImageButton(
              image: AssetImage('images/tet.jpeg'),
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: Text(
                'start game'.toUpperCase(),
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ImageButton(
              image: AssetImage('images/tet.jpeg'),
              onPress: () {},
              child: Text(
                'score'.toUpperCase(),
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final Widget? child;
  final ImageProvider<Object> image;
  final Function()? onPress;

  ImageButton({required this.onPress, required this.image, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: image, fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPress,
          child: child,
        ),
      ),
    );
  }
}
