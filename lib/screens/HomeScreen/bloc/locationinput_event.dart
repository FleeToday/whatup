import 'package:equatable/equatable.dart';

abstract class LocationInputEvent extends Equatable {
  const LocationInputEvent();
}

class UpdateLocationInput extends LocationInputEvent {
  final String input;
  UpdateLocationInput([this.input]);

  @override
  List<Object> get props => [this.input];
}
