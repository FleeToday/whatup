import 'package:flutter/material.dart';
import 'package:whatup/models/Activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  title: Text(activity.title),
                  subtitle: Text(activity.description)),
            ],
          ),
        ));
  }
}
