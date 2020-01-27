import 'package:flutter/material.dart';

class NameQuestionPageWidget extends StatelessWidget {
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final Function _onFirstNameChanged;
  final Function _onLastNameChanged;
  final Function _onBlur;

  const NameQuestionPageWidget({
    Key key,
    @required TextEditingController firstNameController,
    @required TextEditingController lastNameController,
    @required Function onFirstNameChanged,
    @required Function onLastNameChanged,
    @required Function onBlur,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _onFirstNameChanged = onFirstNameChanged,
        _onLastNameChanged = onLastNameChanged,
        _onBlur = onBlur,
        super(key: key);

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
            textInputAction: TextInputAction.next,
            onEditingComplete: _onBlur,
            onChanged: _onFirstNameChanged,
            controller: _firstNameController,
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
            textInputAction: TextInputAction.done,
            onEditingComplete: _onBlur,
            onChanged: _onLastNameChanged,
            controller: _lastNameController,
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
