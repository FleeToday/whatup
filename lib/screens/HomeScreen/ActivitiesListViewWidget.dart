import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';

class ActivitiesListView extends StatefulWidget {
  @override
  _ActivitiesListViewState createState() => _ActivitiesListViewState();
}

class _ActivitiesListViewState extends State<ActivitiesListView> {
  final _repository = Repository();

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _repository.getActivities(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return Swiper(
          itemBuilder: (context, i) {
            return _buildListItem(context, snapshot.data.documents, i);
          },
          itemCount: snapshot.data.documents.length,
          viewportFraction: 0.8,
          scale: 0.95,
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, List<DocumentSnapshot> data, i) {
    final activity = Activity.fromSnapshot(data[i]);

    return SizedBox(
      width: 300,
      height: 180,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
    return Container(
        alignment: Alignment.bottomCenter,
        height: 200,
        child: _buildBody(context));
  }
}
