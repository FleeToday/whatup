import 'package:flutter/material.dart';
import 'package:whatup/models/Activity.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailScreen({Key key, this.activity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          expandedHeight: 250,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: "image_${activity.reference.documentID}",
              child: Image.network(
                  "https://d3ph2ovtiyj37.cloudfront.net/wp-content/uploads/2019/10/15153839/easyhikingtrailshongkong-870x435.jpg",
                  fit: BoxFit.cover),
            ),
          )),
      SliverFillRemaining(
        child: 
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            activity.title,
            style: Theme.of(context).textTheme.headline,
          ),
          decoration: BoxDecoration(color: Colors.white,),
        ),
      )
    ]));
  }
}
