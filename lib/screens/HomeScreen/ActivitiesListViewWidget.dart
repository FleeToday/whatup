import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/ActivityDetailScreen/ActivityDetailScreen.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityCard.dart';

import 'bloc/bloc.dart';

class ActivitiesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
    final ActivityBloc activityBloc = BlocProvider.of<ActivityBloc>(context);

    return Container(
        alignment: Alignment.bottomCenter,
        height: 230,
        child: BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if (state is LoadingActivity) {
              return LinearProgressIndicator();
            } else if (state is LoadedActivity) {
              return Swiper(
                loop: false,
                itemBuilder: (context, i) {
                  final activity = state.activityList.items[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                        width: 300, child: ActivityCard(activity: activity)),
                  );
                },
                onTap: (int i) {
                  var route = MaterialPageRoute(
                      builder: (context) => ActivityDetailScreen(
                            activity: state.activityList.items[i],
                          ));
                  Navigator.of(context).push(route);
                },
                onIndexChanged: (int i) {
                  LatLng _center = state.activityList.items[i].location;
                  mapBloc.add(MoveCamera(_center));
                  // activityBloc.add(FetchActivity(_center));
                },
                itemCount: state.activityList.items.length,
                viewportFraction: 0.9,
                scale: 0.8,
              );
            }
          },
        ));
  }
}
