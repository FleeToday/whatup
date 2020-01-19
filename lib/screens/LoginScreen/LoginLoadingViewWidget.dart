import 'package:flutter/material.dart';

class LoginLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Container(
          child: Text('Loading'),
          margin: EdgeInsets.all(16),
        )
      ],
    ));
  }
}
