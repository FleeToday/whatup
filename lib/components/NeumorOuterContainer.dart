import 'package:flutter/material.dart';

class NeumorOuterContainer extends StatelessWidget {
  NeumorOuterContainer({this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(200, 200, 225, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: this.child);
  }
}
