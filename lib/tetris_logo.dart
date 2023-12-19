import 'package:flutter/material.dart';

import 'constant.dart';

class TetrisLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          'T',
          style: kTextStyle
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          width: 200,
          height: 175,
          // color: Colors.red,
          child: Column(

            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  MyContainer(),
                  MyContainer(),
                  MyContainer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'E',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    width: 15,
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyContainer(),
                      MyContainer(),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'R',
                    style: kTextStyle
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'I',
          style: kTextStyle
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'S',
          style: kTextStyle
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  // final DecorationImage image;

  // MyContainer({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffdedeff),

        // image: image,
        borderRadius: BorderRadius.circular(10),

      ),
      width: 50,
      height: 50,
      margin: EdgeInsets.all(2.5),
    );
  }
}
