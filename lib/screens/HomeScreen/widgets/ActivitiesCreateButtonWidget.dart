import 'package:flutter/material.dart';

class ActivitiesCreateButtonWidget extends StatelessWidget {
  const ActivitiesCreateButtonWidget({Key key, this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: ShapeDecoration(
      //     // shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
      //     shape: CircleBorder(side: BorderSide.none)),
      child: Container(
        height: 40,
        width: 40,
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
            shape: CircleBorder(side: BorderSide.none)),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.refresh,
            size: 25,
          ),
          color: Theme.of(context).accentColor,
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
