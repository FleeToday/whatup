import 'package:flutter/material.dart';
import 'package:whatup/models/Hobby.dart';

class HobbyPageWidget extends StatefulWidget {
  Function onToggleHobby;
  List<Hobby> selectedHobbies;

  HobbyPageWidget({this.onToggleHobby, this.selectedHobbies});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HobbyPageState();
  }
}

class HobbyPageState extends State<HobbyPageWidget> {
  List<Hobby> hobbies = [
    Hobby("id", "Jogging", "cat", null),
    Hobby("id", "Swimming", "cat", null),
    Hobby("id", "Coffee", "cat", null),
    Hobby("id", "Climbing", "cat", null),
    Hobby("id", "Happy Hour", "cat", null),
    Hobby("id", "Gaming", "cat", null),
    Hobby("id", "Movies", "cat", null),
    Hobby("id", "Reading", "cat", null),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onSelected(Hobby hobby) {
    this.widget.onToggleHobby(hobby);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Tell Us Your Hobbies',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: Theme.of(context).primaryTextTheme.headline.fontSize),
        ),
        Container(
          height: 20,
        ),
        Wrap(
          spacing: 4.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: this.hobbies.map(
            (e) {
              return FlatButton(
                onPressed: () => {this._onSelected(e)},
                padding: EdgeInsets.all(0),
                child: Chip(
                  avatar: widget.selectedHobbies.contains(e)
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColorDark,
                        )
                      : null,
                  label: Text(e.name),
                ),
              );
            },
          ).toList(),
        ),
      ]),
    );
  }
}
