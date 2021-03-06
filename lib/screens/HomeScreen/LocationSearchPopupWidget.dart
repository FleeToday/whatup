import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';

const kGoogleApiKey = "AIzaSyA5feactDV3qCiw1W5a0DdkCqgnCBazxCs";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class LocationSearchPopupWidget extends PlacesAutocompleteWidget {
  LocationSearchPopupWidget()
      : super(
          apiKey: kGoogleApiKey,
          language: "en",
          radius: 10000000,
          components: [Component(Component.country, "hk")],
        );

  @override
  _LocationSearchPopupWidgetState createState() =>
      _LocationSearchPopupWidgetState();
}

Future<Null> displayPrediction(BuildContext context, Prediction p) async {
  if (p != null) {
    // get detail (lat/lng)
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final double lat = detail.result.geometry.location.lat;
    final double lng = detail.result.geometry.location.lng;
    final String _locationName = detail.result.name;
    final LatLng _center = LatLng(lat, lng);

    BlocProvider.of<MapBloc>(context).add(MoveCamera(_center));
    BlocProvider.of<LocationInputBloc>(context)
        .add(UpdateLocationInput(_locationName));
    Navigator.pop(context);
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
            displayPrediction(context, p);
          },
        ));
  }
}
