import 'package:flutter/material.dart';
import 'package:whatup/screens/ProfileScreen/ProfileScreen.dart';

class AppBarProfileButtonWidget extends StatelessWidget {
  const AppBarProfileButtonWidget({Key key, this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
          color: Colors.white,
          shape: CircleBorder(side: BorderSide.none)),
      child: Hero(
        tag: 'profile',
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          color: Colors.lightBlue,
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
