import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocationInputBloc extends Bloc<LocationInputEvent, LocationInputState> {
  @override
  LocationInputState get initialState => EmptyLocationInput();

  @override
  Stream<LocationInputState> mapEventToState(
    LocationInputEvent event,
  ) async* {
    if (event is UpdateLocationInput) {
      if (event.input.length == 0) {
        yield EmptyLocationInput();
      } else {
        yield FilledLocationInput(input: event.input);
      }
    }
  }
}
