import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_event.dart';

import 'bloc/map_bloc.dart';

const kGoogleApiKey = "AIzaSyA5feactDV3qCiw1W5a0DdkCqgnCBazxCs";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class LocationSearchPopupWidget extends PlacesAutocompleteWidget {
  LocationSearchPopupWidget()
      : super(
          apiKey: kGoogleApiKey,
          sessionToken: "123",
          language: "en",
          radius: 10000000,
          components: [Component(Component.country, "hk")],
        );

  @override
  _LocationSearchPopupWidgetState createState() =>
      _LocationSearchPopupWidgetState();
}

void updateLocation(BuildContext context, LatLng center) {
  final mapBloc = BlocProvider.of<MapBloc>(context);
  mapBloc.add(UpdateMap(center));
}

Future<Null> displayPrediction(Prediction p, BuildContext context) async {
  if (p != null) {
    // get detail (lat/lng)
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final double lat = detail.result.geometry.location.lat;
    final double lng = detail.result.geometry.location.lng;
    final LatLng _center = LatLng(lat, lng);
    updateLocation(context, _center);
    Navigator.of(context).pop();
    // scaffold.showSnackBar(
    //   SnackBar(content: Text("${p.description} - $lat/$lng")),
    // );
    // print("get place");
    // print("pop nav");
  }
}

class _LocationSearchPopupWidgetState extends PlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: searchScaffoldKey,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: AppBarPlacesAutoCompleteTextField(),
          backgroundColor: Colors.white,
        ),
        body: PlacesAutocompleteResult(
          onTap: (p) {
            displayPrediction(p, context);
          },
        ));
  }
}
