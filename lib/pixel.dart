import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  Color? color;
  String? child;


  Pixel({required this.color ,  this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(child!)),
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(4)),
      margin: EdgeInsets.all(1.5),
    );
  }
}
