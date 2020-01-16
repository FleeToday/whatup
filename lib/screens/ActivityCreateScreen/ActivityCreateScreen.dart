import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchPopupWidget.dart';

class ActivityCreateScreen extends StatefulWidget {
  @override
  _ActivityCreateScreenState createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  final _activity = Activity();
  final _formKey = GlobalKey<FormState>();
  double _formLat;
  double _formLng;
  Repository _repository = Repository();

  void _updateFormLocation(double lat, double lng) {
    setState(() {
      _activity.location = LatLng(lat, lng);
    });
  }

  void _formSubmit() {
    _formKey.currentState.save();
    _updateFormLocation(_formLat, _formLng);
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
            TextFormField(
              decoration: InputDecoration(hintText: "Lat"),
              onSaved: (String val) {
                final double lat = num.tryParse(val);
                setState(() {
                  _formLat = lat;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Lng"),
              onSaved: (String val) {
                final double lng = num.tryParse(val);
                setState(() {
                  _formLng = lng;
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
