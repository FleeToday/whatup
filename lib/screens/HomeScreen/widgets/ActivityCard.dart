import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/main.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/screens/HomeScreen/bloc/activity_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/activity_event.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityTime.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

import '../../../models/UserProfile.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({@required this.activity});

  @override
  Widget build(BuildContext context) {
    bool isActivityJoinable = true;
    UserProfileState userProfileState =
        BlocProvider.of<UserProfileBloc>(context).state;
    if (userProfileState is UserProfileRetrievalSuccess) {
      if (activity.members
              .map((item) => item.id)
              .toList()
              .contains(userProfileState.currentUserProfile.id) ||
          activity.members.length > 5) {
        isActivityJoinable = false;
      }
    } else {
      isActivityJoinable = false;
    }
    return Card(
        elevation: 5,
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: NeumorConvexContainer(
          borderRadius: BorderRadius.circular(10.0),
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
                child: Stack(alignment: Alignment.topRight, children: [
                  Visibility(
                    visible: isActivityJoinable,
                    child: IconButton(
                      onPressed: () {
                        this.activity.members.add(
                            (userProfileState as UserProfileRetrievalSuccess)
                                .currentUserProfile);
                        BlocProvider.of<ActivityBloc>(context)
                            .add(UpdateActivity(this.activity));
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.add_box,
                        size: 25,
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 22),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.pin_drop,
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            activity.locationName != null
                                                ? activity.locationName
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subhead
                                                .copyWith(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: activity.members
                                .where(
                                    (profile) => profile.firstName.isNotEmpty)
                                .map((UserProfile userProfile) {
                              return Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(right: 4),
                                child: NeumorConcaveContainer(
                                  gradient: LinearGradient(
                                    end: Alignment.bottomRight,
                                    begin: Alignment.bottomLeft,
                                    stops: [
                                      0.0,
                                      8.0,
                                    ],
                                    colors: [
                                      Theme.of(context).primaryColorDark,
                                      Theme.of(context).primaryColor,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Center(
                                    child: Text(
                                        userProfile.firstName
                                            .split(' ')
                                            .map((String item) => item[0])
                                            .join(''),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200)),
                                  ),
                                ),
                              );
                            }).toList(),
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
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
