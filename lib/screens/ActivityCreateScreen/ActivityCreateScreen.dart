import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/components/KeyboardAvoidingView.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';
import 'package:whatup/components/NeumorTextField.dart';
import 'package:whatup/main.dart';
import 'package:whatup/models/Activity.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:whatup/screens/ActivityCreateScreen/ActivityType.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/utilities/PrimaryGradientDecoration.dart';

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
  double animatingPadding = 500;
  double animatingBackgroundPadding = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 20), () {
      this.setState(() {
        animatingPadding = 80;
      });
    });
    Future.delayed(Duration(milliseconds: 150), () {
      this.setState(() {
        animatingBackgroundPadding = 250;
      });
    });
  }

  void _formSubmit() {
    _formKey.currentState.save();
    UserProfileState userProfileState =
        BlocProvider.of<UserProfileBloc>(context).state;
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
        _activity.locationName = detail.result.name;
        _activity.location = LatLng(lat, lng);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                stops: [
                  0.5,
                  1.0,
                ],
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.9),
                  Theme.of(context).primaryColorDark.withOpacity(0.9),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 1000),
            padding: EdgeInsets.only(top: this.animatingBackgroundPadding),
            child: NeumorConvexContainer(),
          ),
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 250),
            padding: EdgeInsets.only(top: this.animatingPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Discovery",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        "Choose your mood...",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container(child: this.renderGrid())),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget renderGrid() {
    return OverflowBox(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        primary: true,
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        padding: const EdgeInsets.all(30.0),
        children: ACTIVITY_TYPE_LIST.map((ActivityType activityType) {
          return Container(
            child: NeumorFlatContainer(
              borderRadius: BorderRadius.circular(20),
              child: NeumorConvexContainer(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      activityType.iconData,
                      size: 60,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    Padding(
                      child: Text(
                        activityType.title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget renderForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 15,
            ),
            NeumorTextField(
              labelText: "Title",
              onSaved: (String val) {
                setState(() {
                  _activity.title = val;
                });
              },
            ),
            Container(
              height: 15,
            ),
            NeumorTextField(
              labelText: "Description",
              // maxLines: 5,
              onSaved: (String val) {
                setState(() {
                  _activity.description = val;
                });
              },
            ),
            Container(
              height: 15,
            ),
            NeumorTextField(
              labelText: "Location",
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
              padding: const EdgeInsets.only(top: 40),
              child: FlatButton(
                onPressed: _formSubmit,
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                color: Colors.transparent,
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  duration: Duration(milliseconds: 500),
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(16.0),
                  child: const Text('Submit',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
