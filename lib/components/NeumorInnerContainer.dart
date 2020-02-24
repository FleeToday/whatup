import 'package:flutter/material.dart';

class NeumorInnerContainer extends StatelessWidget {
  NeumorInnerContainer({this.child, this.borderRadius});

  BorderRadius borderRadius;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(225, 225, 250, 1), //color: Colors.purple[200],
        borderRadius: this.borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black12,
            Colors.transparent,
            Colors.transparent,
            Colors.white10,
            Colors.white30,
          ], stops: [
            0.0,
            0.45,
            0.5,
            0.5,
            1.0
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: this.borderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black12,
                Colors.transparent,
                Colors.transparent,
                Colors.white10,
                Colors.white30,
              ], stops: [
                0.0,
                0.05,
                0.5,
                0.95,
                1.0
              ]),
              borderRadius: this.borderRadius),
          child: this.child,
        ),
      ),
    );
  }
}
