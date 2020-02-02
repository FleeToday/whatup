import 'package:flutter/material.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityTime.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 230,
              width: 130,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Hero(
                    tag: "image_${activity.reference.documentID}",
                    child: Image.network(
                        "https://d3ph2ovtiyj37.cloudfront.net/wp-content/uploads/2019/10/15153839/easyhikingtrailshongkong-870x435.jpg",
                        fit: BoxFit.cover),
                  )),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: "title_${activity.reference.documentID}",
                            child: Text(
                              activity.title,
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              activity.locationName,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ActivityTime(
                      datetime: activity.datetime,
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
