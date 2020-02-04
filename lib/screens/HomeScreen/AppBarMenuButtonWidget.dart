import 'package:flutter/material.dart';

class AppBarMenuButtonWidget extends StatelessWidget {
  const AppBarMenuButtonWidget({Key key, this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: ShapeDecoration(
      //     // shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
      //     shape: CircleBorder(side: BorderSide.none)),
      child: Container(
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
            shape: CircleBorder(side: BorderSide.none)),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.notifications,
            size: 25,
          ),
          color: Theme.of(context).accentColor,
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
