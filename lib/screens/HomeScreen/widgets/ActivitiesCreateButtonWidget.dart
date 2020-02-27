import 'package:flutter/material.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';

class ActivitiesCreateButtonWidget extends StatelessWidget {
  const ActivitiesCreateButtonWidget({Key key, this.onPressed})
      : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
          shape: CircleBorder(side: BorderSide.none)),
      child: NeumorConvexContainer(
        // decoration: ShapeDecoration(
        //     // shadows: [BoxShadow(color: Colors.black38, blurRadius: 2)],
        //     shape: CircleBorder(side: BorderSide.none)),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 40,
          width: 40,
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.refresh,
              size: 25,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: this.onPressed,
          ),
        ),
      ),
    );
  }
}
