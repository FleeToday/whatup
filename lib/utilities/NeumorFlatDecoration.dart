import 'package:flutter/material.dart';

// const color = Color.fromRGBO(235, 235, 250, 1);

const;

class NeumorFlatDecoration extends BoxDecoration {
  const NeumorFlatDecoration(
      {BorderRadius borderRadius, Color color, bool convex})
      : super(
          borderRadius: borderRadius,
          color: color,
          boxShadow: const [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 10.0,
    spreadRadius: 0.0,
    offset: Offset(
      5.0,
      5.0,
    ),
  ),
  BoxShadow(
    color: Colors.white38,
    blurRadius: 10.0,
    spreadRadius: 0.0,
    offset: Offset(
      -5.0,
      -5.0,
    ),
  )
],
        );
}
