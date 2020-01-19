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
    }
  }

  Stream<ActivityState> _mapFetchActivityToState(FetchActivity event) async* {
    ActivityList _activityList =
        await _repository.getActivitiesByCenter(event.center, event.radius);
    yield LoadedActivity(event.center, event.radius, _activityList);
  }

  Stream<ActivityState> _mapCreateActivityToState(CreateActivity event) async* {
    await _repository.addActivity(event.activity);
    if (state is LoadedActivity) {
      ActivityList _activityList = await _repository.getActivitiesByCenter(
          (state as LoadedActivity).center, (state as LoadedActivity).radius);
      yield LoadedActivity((state as LoadedActivity).center,
          (state as LoadedActivity).radius, _activityList);
    }
  }
}
