import 'package:gallery_base/models/album.dart';
import 'package:gallery_base/models/photo.dart';

abstract class StateBase { }
class UninitialisedState extends StateBase {} // Initial
class InitialisingState extends StateBase {} // Initialising
class GetListState extends StateBase {} // Local
class ErrorState extends StateBase {
  String message;
  ErrorState({this.message = 'Oops Something Went Wrong :(, try again later'});
}

class GetAlbumListState extends GetListState {
  List<Album> albumList = [];
  GetAlbumListState(this.albumList);
}

class GetAlbumThumbnailListState extends GetListState {
  List<Photo> photoList = [];
  GetAlbumThumbnailListState(this.photoList);
}