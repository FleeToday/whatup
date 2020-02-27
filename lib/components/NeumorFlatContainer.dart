import 'package:flutter/material.dart';
import 'package:whatup/main.dart';
import 'package:whatup/utilities/NeumorFlatDecoration.dart';

class NeumorFlatContainer extends StatelessWidget {
  NeumorFlatContainer({this.child, this.borderRadius, this.color});

  Widget child;
  BorderRadius borderRadius;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: NeumorFlatDecoration(
        color: this.color != null ? this.color : mainColor,
        borderRadius: borderRadius,
      ),
      child: this.child,
    );
  }
}
