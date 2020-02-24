import 'package:flutter/material.dart';

const color = Color.fromRGBO(235, 235, 250, 1);

const neumorBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 20.0,
    spreadRadius: 0.0,
    offset: Offset(
      5.0,
      5.0,
    ),
  ),
  BoxShadow(
    color: Colors.white,
    blurRadius: 15.0,
    spreadRadius: 0.0,
    offset: Offset(
      -5.0,
      -5.0,
    ),
  )
];

class NeumorOuterDecoration extends BoxDecoration {
  const NeumorOuterDecoration({BorderRadius borderRadius})
      : super(
          borderRadius: borderRadius,
          color: color, //Color.fromRGBO(48, 117, 207, 1), // 4783d1
          boxShadow: neumorBoxShadow,
        );
}
