import 'package:equatable/equatable.dart';

abstract class LocationInputState extends Equatable {
  const LocationInputState();
}

class EmptyLocationInput extends LocationInputState {
  @override
  List<Object> get props => null;
}

class FilledLocationInput extends LocationInputState {
  final String input;

  FilledLocationInput({this.input});
  @override
  List<Object> get props => null;
}
