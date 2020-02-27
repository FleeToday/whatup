import 'package:flutter/material.dart';
import 'package:whatup/main.dart';

class NeumorConcaveContainer extends StatelessWidget {
  NeumorConcaveContainer(
      {this.child,
      this.borderRadius,
      this.verticalStops,
      this.horizontalStops});

  BorderRadius borderRadius;
  Widget child;

  List<double> verticalStops;

  List<double> horizontalStops;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: this.borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.black12.withOpacity(0.1),
                Colors.black12.withOpacity(0.01),
                Colors.white10.withOpacity(0.01),
                Colors.white10.withOpacity(0.1),
                Colors.white30.withOpacity(0.5),
              ],
              stops: this.verticalStops != null
                  ? this.verticalStops
                  : [0.0, 0.3, 0.8, 0.9, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: this.borderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black12.withOpacity(0.1),
                    Colors.black12.withOpacity(0.01),
                    Colors.white10.withOpacity(0.01),
                    Colors.white10.withOpacity(0.1),
                    Colors.white30.withOpacity(0.5),
                  ],
                  stops: this.horizontalStops != null
                      ? this.horizontalStops
                      : [0.0, 0.05, 0.5, 0.95, 1.0]),
              borderRadius: this.borderRadius),
          child: this.child,
        ),
      ),
    );
  }
}
