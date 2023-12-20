import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {

  final Color? color;
   final ImageProvider image;


  Pixel({this.color ,  required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(image: image,fit: BoxFit.cover),
          color: color,borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(1.0),
    );
  }
}
