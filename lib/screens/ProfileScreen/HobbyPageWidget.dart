import 'package:flutter/material.dart';
import 'package:whatup/models/Hobby.dart';

class HobbyPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HobbyPageState();
  }
}

class HobbyPageState extends State<HobbyPageWidget> {
  List<Widget> chips = [];
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
  List<bool> isSelected = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < hobbies.length; i++) {
      isSelected.add(false);
    }
  }

  void _onSelected(int index) {
    this.setState(() {
      this.isSelected[index] = !this.isSelected[index];
    });
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
              int index = this.hobbies.indexOf(e);
              return FlatButton(
                onPressed: () => {this._onSelected(index)},
                padding: EdgeInsets.all(0),
                child: Chip(
                  avatar: this.isSelected[index]
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
