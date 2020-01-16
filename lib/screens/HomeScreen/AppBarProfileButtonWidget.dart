import 'package:flutter/material.dart';

class AppBarProfileButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
          color: Colors.white,
          shape: CircleBorder(side: BorderSide.none)),
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          Icons.account_circle,
          size: 30,
        ),
        color: Colors.lightBlue,
        onPressed: () {},
      ),
    );
  }
}
