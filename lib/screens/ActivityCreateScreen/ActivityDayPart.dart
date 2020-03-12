import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ActivityDayPart {
  final String title;
  final IconData iconData;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const ActivityDayPart(
      {this.title, this.iconData, this.startTime, this.endTime});
}

const ACTIVITY_DAY_PART_MORNING = const ActivityDayPart(
    title: 'Morning',
    iconData: MaterialCommunityIcons.coffee,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 11, minute: 0));

const ACTIVITY_DAY_PART_NOON = const ActivityDayPart(
    title: 'Noon',
    iconData: MaterialCommunityIcons.coffee,
    startTime: TimeOfDay(hour: 11, minute: 0),
    endTime: TimeOfDay(hour: 15, minute: 0));

const ACTIVITY_DAY_PART_AFTERNOON = const ActivityDayPart(
    title: 'Afternoon',
    iconData: MaterialCommunityIcons.coffee,
    startTime: TimeOfDay(hour: 15, minute: 0),
    endTime: TimeOfDay(hour: 17, minute: 0));

const ACTIVITY_DAY_PART_EVENING = const ActivityDayPart(
    title: 'Afternoon',
    iconData: MaterialCommunityIcons.coffee,
    startTime: TimeOfDay(hour: 17, minute: 0),
    endTime: TimeOfDay(hour: 20, minute: 0));

const List<ActivityDayPart> ACTIVITY_TYPE_LIST = const [
  const ActivityDayPart(
      title: 'Happy Hour!', iconData: MaterialCommunityIcons.glass_cocktail),
  const ActivityDayPart(
      title: 'Lunch', iconData: MaterialCommunityIcons.food_croissant),
  const ActivityDayPart(
      title: 'Dinner', iconData: MaterialCommunityIcons.silverware_fork_knife),
  const ActivityDayPart(
      title: 'Lunch', iconData: MaterialCommunityIcons.food_croissant),
  const ActivityDayPart(
      title: 'Dinner', iconData: MaterialCommunityIcons.silverware_fork_knife),
];
