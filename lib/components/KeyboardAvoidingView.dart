import 'package:flutter/material.dart';

class KeyboardAvoidingView extends StatelessWidget {
  KeyboardAvoidingView({this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Container(
      height: height,
      width: width,
      child: this.child,
    ));
  }
}
