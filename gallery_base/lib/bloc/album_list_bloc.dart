import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_base/models/album.dart';
import 'package:gallery_base/models/user.dart';
import 'package:gallery_base/service/album_service.dart';
import 'package:gallery_base/service/user_service.dart';
import 'states.dart';
import 'events.dart';

class AlbumListBloc extends Bloc<EventBase, StateBase> {
  List<User> user_list = [];
  List<Album> album_list = [];

  AlbumListBloc(StateBase initialState) : super(initialState);

  @override
  StateBase get initialState => UninitialisedState();

  @override
  Stream<StateBase> mapEventToState(
    EventBase event,
  ) async* {
    try {
      switch (event.runtimeType) {
        case EventPullList:
          yield InitialisingState();
          try {
            this.user_list = await AlbumService.getAllUserList();
            this.album_list = await AlbumService.getAllAblumList();
          } on TimeoutException catch (e) {
            yield ErrorState(message: 'No Internet, please try reconnect and tap to refresh');
            return;
          } on SocketException catch (e) {
            yield ErrorState(message: 'No Internet, please try reconnect and tap to refresh');
            return;
          } catch (e) {
            throw e;
          }

          this.album_list = UserService.mapUserDataToAlbum(this.user_list, this.album_list);
          yield GetAlbumListState(this.album_list);
          break;
        default:
          yield ErrorState();
      }
    } catch (e) {
      yield ErrorState();
    }
  }
}
