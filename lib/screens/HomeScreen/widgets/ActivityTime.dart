import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityTime extends StatelessWidget {
  final DateTime datetime;

  const ActivityTime({Key key, this.datetime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('hh:mm a');
    String formatted_datetime = formatter.format(this.datetime);
    return Row(
      children: [
        Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: Row(children: <Widget>[
          Icon(
            Icons.access_time,
            size: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(formatted_datetime),
          ),
        ]),
      ),
    ),],);
  }
}
