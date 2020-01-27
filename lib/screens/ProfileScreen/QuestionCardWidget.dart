import 'package:flutter/material.dart';

class QuestionCardWidget extends StatelessWidget {
  final Widget child;

  const QuestionCardWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: SingleChildScrollView(child: child),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Theme.of(context).primaryColorLight,
                width: 2,
                style: BorderStyle.solid),
            color: Theme.of(context).primaryColorLight,
          )),
    );
  }
}
