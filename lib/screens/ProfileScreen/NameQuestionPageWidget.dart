import 'package:flutter/material.dart';

class NameQuestionPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us Your Name',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: Theme.of(context).primaryTextTheme.headline.fontSize),
          ),
          Container(
            height: 32,
          ),
          TextField(
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: Theme.of(context).primaryTextTheme.title.fontSize),
            decoration: InputDecoration(
              labelText: "First Name",
              labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: Theme.of(context).primaryTextTheme.title.fontSize),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 4.0),
              ),
            ),
          ),
          Container(
            height: 32,
          ),
          TextField(
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: Theme.of(context).primaryTextTheme.title.fontSize),
            decoration: InputDecoration(
              labelText: "Last Name",
              labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: Theme.of(context).primaryTextTheme.title.fontSize),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 4.0),
              ),
            ),
          )
        ]);
  }
}
