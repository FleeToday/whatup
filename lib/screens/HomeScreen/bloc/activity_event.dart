import 'package:equatable/equatable.dart';
import 'package:whatup/models/Activity.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();
}

class FetchActivity extends ActivityEvent {
  FetchActivity();
  @override
  List<Object> get props => null;
}

class CreateActivity extends ActivityEvent {
  final Activity activity;

  CreateActivity([this.activity]);

  @override
  List<Object> get props => [this.activity];
}
