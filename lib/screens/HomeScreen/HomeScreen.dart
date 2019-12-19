import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Activity {
  final title;
  final description;
  final DocumentReference reference;

  Activity.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['description'] != null),
        title = map['title'],
        description = map['description'];

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class HomeScreen extends StatelessWidget {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('activities').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final activity = Activity.fromSnapshot(data);

    return SizedBox(
      width: 300,
      height: 180,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Text(activity.title),
                    subtitle: Text(activity.description)),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 230),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/create');
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          new SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: 350,
                height: 50,
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search Location',
                    prefixIcon: Icon(
                      Icons.pin_drop,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  height: 200,
                  child: _buildBody(context))
            ],
          )),
        ]));
  }
}
