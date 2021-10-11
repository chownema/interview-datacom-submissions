import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_base/models/photo.dart';
import 'package:gallery_base/service/album_service.dart';
import 'states.dart';
import 'events.dart';

class AlbumBloc extends Bloc<EventBase, StateBase> {
  List<Photo> photoList = []; // Network

  AlbumBloc(StateBase initialState) : super(initialState);

  @override
  StateBase get initialState => UninitialisedState();

  @override
  Stream<StateBase> mapEventToState(
    EventBase event,
  ) async* {
    try {
      switch (event.runtimeType) {
        case EventPullList:
          yield InitialisingState(); // Show spinner and reload content
          EventPullList pEvent = (event as EventPullList);
          try {
            this.photoList = await AlbumService.getAllPhotoList();
          } on TimeoutException catch (e) {
            yield ErrorState(message: 'No Internet, please try reconnect and tap to refresh');
            return;
          } on SocketException catch (e) {
            yield ErrorState(message: 'No Internet, please try reconnect and tap to refresh');
            return;
          }
          List<Photo> photoFilteredList = this.photoList.where((e) => e.albumId == pEvent.id).toList();
          yield GetAlbumThumbnailListState(photoList=photoFilteredList);
          break;
        default:
          yield ErrorState();
      }
    } catch (e) {
      yield ErrorState();
    }
  }
}
