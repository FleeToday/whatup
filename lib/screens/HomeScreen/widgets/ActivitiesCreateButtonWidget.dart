import 'package:flutter/material.dart';

class ActivitiesCreateButtonWidget extends StatelessWidget {
  const ActivitiesCreateButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/create');
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
