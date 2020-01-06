import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';

class ActivityCreateScreen extends StatefulWidget {
  @override
  _ActivityCreateScreenState createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  final _activity = Activity();
  final _formKey = GlobalKey<FormState>();
  Repository _repository = Repository();

  void _formSubmit() {
    _formKey.currentState.save();
    _repository.addActivity(_activity);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Title"),
              onSaved: (String val) {
                setState(() {
                  _activity.title = val;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Description"),
              onSaved: (String val) {
                setState(() {
                  _activity.description = val;
                });
              },
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: _formSubmit,
                  child: Text("submit"),
                ))
          ],
        ),
      )),
    );
  }
}
