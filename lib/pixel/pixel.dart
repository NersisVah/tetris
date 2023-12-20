import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final ImageProvider image;

  Pixel({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
