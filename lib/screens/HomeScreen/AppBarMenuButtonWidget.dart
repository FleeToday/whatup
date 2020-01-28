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
      child: Hero(
        tag: 'profile',
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          color: Theme.of(context).accentColor,
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
