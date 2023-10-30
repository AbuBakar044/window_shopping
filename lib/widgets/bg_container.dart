import 'package:flutter/material.dart';

Widget bgContainer(double height, double width, String bgImage) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
    ),
  );
}

