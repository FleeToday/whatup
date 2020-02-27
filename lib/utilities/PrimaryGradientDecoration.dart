import 'package:flutter/material.dart';

BoxDecoration getPrimaryGradientBoxDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    gradient: LinearGradient(
      end: Alignment.bottomRight,
      begin: Alignment.bottomLeft,
      stops: [
        0.0,
        1.0,
      ],
      colors: [
        Theme.of(context).primaryColorDark,
        Theme.of(context).primaryColor,
      ],
    ),
  );
}
