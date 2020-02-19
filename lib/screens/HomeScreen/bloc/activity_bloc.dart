import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:whatup/models/ActivityList.dart';
import 'package:whatup/resources/Repository.dart';
import './bloc.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final Repository _repository = Repository();

  @override
  ActivityState get initialState => LoadingActivity();

  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    if (event is CreateActivity) {
      yield* _mapCreateActivityToState(event);
    } else if (event is FetchActivity) {
      yield* _mapFetchActivityToState(event);
    } else if (event is UpdateActivity) {
      yield* _mapUpdateActivityToState(event);
    }
  }

  Stream<ActivityState> _mapFetchActivityToState(FetchActivity event) async* {
    yield LoadingActivity();
    ActivityList _activityList =
        await _repository.getActivitiesByCenter(event.center, event.radius);
    yield LoadedActivity(_activityList);
  }

  Stream<ActivityState> _mapCreateActivityToState(CreateActivity event) async* {
    await _repository.addActivity(event.activity);
    ActivityList _activityList =
        await _repository.getActivitiesByCenter(event.activity.location, 10);
    yield LoadedActivity(_activityList);
  }

  Stream<ActivityState> _mapUpdateActivityToState(UpdateActivity event) async* {
    await _repository.updateActivity(event.activity);
    ActivityList _activityList =
        await _repository.getActivitiesByCenter(event.activity.location, 10);
    yield LoadedActivity(_activityList);
  }
}
