import 'package:flutter/material.dart';

BoxDecoration getPrimaryGradientBoxDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    gradient: getPrimaryGradient(context),
  );
}

Gradient getPrimaryGradient(BuildContext context) {
  return LinearGradient(
    end: Alignment.bottomRight,
    begin: Alignment.bottomLeft,
    stops: [
      0.0,
      1.0,
    ],
    colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColorLight,
    ],
  );
}
