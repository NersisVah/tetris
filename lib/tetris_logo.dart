import 'package:flutter/material.dart';

import 'constant.dart';

class TetrisLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          'T',
          style: kTextStyle.copyWith(color: kMyRedColor),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 120,
          height: 120,
          // color: Colors.red,
          child: Column(

            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  MyContainer(
                    color: kMyRedColor,
                  ),
                  MyContainer(
                    color: kMyGreenColor,
                  ),
                  MyContainer(
                    color: kMyYellowColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'E',
                      style: kTextStyle.copyWith(color: kMyGreenColor,),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyContainer(
                        color: kMyRedColor,
                      ),
                      MyContainer(
                        color: kMyYellowColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'R',
                    style: kTextStyle.copyWith(
                      color: kMyGreenColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'I',
          style: kTextStyle.copyWith(color: kMyRedColor),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'S',
          style: kTextStyle.copyWith(color: kMyYellowColor),
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color? color;

  MyContainer({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      width: 30,
      height: 30,
      margin: EdgeInsets.all(2.5),
    );
  }
}
