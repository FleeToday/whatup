import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';

import '../../models/UserProfile.dart';
import '../ProfileScreen/bloc/userProfile_bloc.dart';
import '../ProfileScreen/bloc/userProfile_state.dart';
import '../ProfileScreen/bloc/userProfile_state.dart';

const kGoogleApiKey = "AIzaSyA5feactDV3qCiw1W5a0DdkCqgnCBazxCs";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class ActivityCreateScreen extends StatefulWidget {
  @override
  _ActivityCreateScreenState createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  final _activity = Activity();
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();

  void _formSubmit() {
    _formKey.currentState.save();
    UserProfileState userProfileState = BlocProvider.of<UserProfileBloc>(context).state;
    if (userProfileState is UserProfileRetrievalSuccess) {
      _activity.members.add(userProfileState.currentUserProfile);
    }
    BlocProvider.of<ActivityBloc>(context).add(CreateActivity(_activity));
    Navigator.of(context).pop();
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      _locationController.text = detail.result.name;

      setState(() {
        _activity.location = LatLng(lat, lng);
      });
    }
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
          margin: EdgeInsets.all(20),
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
                  maxLines: 5,
                  onSaved: (String val) {
                    setState(() {
                      _activity.description = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Location"),
                  controller: _locationController,
                  onTap: () async {
                    Prediction p = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      mode: Mode.overlay,
                      radius: 100000,
                      components: [Component(Component.country, "hk")],
                    );
                    displayPrediction(p);
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
