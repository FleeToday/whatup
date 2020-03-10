import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ActivityType {
  final String title;
  final IconData iconData;

  const ActivityType({this.title, this.iconData});
}

const List<ActivityType> ACTIVITY_TYPE_LIST = const [
  const ActivityType(
      title: 'Grab a Coffee', iconData: MaterialCommunityIcons.coffee),
  const ActivityType(
      title: 'Happy Hour!', iconData: MaterialCommunityIcons.glass_cocktail),
  const ActivityType(
      title: 'Lunch', iconData: MaterialCommunityIcons.food_croissant),
  const ActivityType(
      title: 'Dinner', iconData: MaterialCommunityIcons.silverware_fork_knife),
  const ActivityType(
      title: 'Lunch', iconData: MaterialCommunityIcons.food_croissant),
  const ActivityType(
      title: 'Dinner', iconData: MaterialCommunityIcons.silverware_fork_knife),
];
