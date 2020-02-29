import 'package:flutter/material.dart';
import 'package:whatup/main.dart';

class NeumorConvexContainer extends StatelessWidget {
  NeumorConvexContainer(
      {this.child, this.borderRadius, this.color, this.gradient});

  BorderRadius borderRadius;
  Widget child;
  Color color;
  Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: this.gradient != null ? this.gradient : null,
        color: this.gradient == null
            ? (this.color != null ? this.color : mainColor)
            : null,
        borderRadius: this.borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white30.withOpacity(0.5),
            Colors.white10.withOpacity(0.1),
            Colors.white.withAlpha(0),
            Colors.white.withAlpha(0),
            Colors.black12.withOpacity(0.1),
          ], stops: [
            0.0,
            0.3,
            0.8,
            0.9,
            1.0
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: this.borderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white30,
                Colors.white10,
                Colors.white.withAlpha(0),
                Colors.white.withAlpha(0),
                Colors.black12,
              ], stops: [
                0.0,
                0.05,
                0.5,
                0.99,
                1.0
              ]),
              borderRadius: this.borderRadius),
          child: this.child,
        ),
      ),
    );
  }
}
