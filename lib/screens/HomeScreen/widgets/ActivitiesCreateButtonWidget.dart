import 'package:flutter/material.dart';

class ActivitiesCreateButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/create');
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
