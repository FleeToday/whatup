import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';

class ActivitiesCreateButtonWidget extends StatelessWidget {
  const ActivitiesCreateButtonWidget({Key key, this.onPressed})
      : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorFlatContainer(
      borderRadius: BorderRadius.circular(20),
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
              MaterialCommunityIcons.refresh,
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
