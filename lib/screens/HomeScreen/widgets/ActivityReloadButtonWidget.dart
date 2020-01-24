import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/activity_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';

class ActivityReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Theme.of(context).primaryColor,
      child: Text("Reload activities"),
      onPressed: () {
        BlocProvider.of<ActivityBloc>(context).add(FetchActivity());
      },
    );
  }
}
