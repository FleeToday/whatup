import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityCard.dart';

import 'bloc/bloc.dart';

class ActivitiesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapBloc mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
        alignment: Alignment.bottomCenter,
        height: 200,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is LoadingMap) {
              return LinearProgressIndicator();
            } else if (state is LoadedMap) {
              return Swiper(
                itemBuilder: (context, i) {
                  final activity = state.activityList.items[i];
                  return SizedBox(
                      width: 300,
                      height: 180,
                      child: ActivityCard(activity: activity));
                },
                onIndexChanged: (int i) {
                  LatLng _center = state.activityList.items[i].location;
                  mapBloc.add(UpdateMap("testing", _center));
                },
                itemCount: state.activityList.items.length,
                viewportFraction: 0.8,
                scale: 0.95,
              );
            }
          },
        ));
  }
}
