import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMapState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is UpdateMap) {
      yield* _mapUpdateMapToState(event);
    }
  }

  Stream<MapState> _mapUpdateMapToState(UpdateMap event) async* {
    yield LocationSelected(event.center);
  }
}
