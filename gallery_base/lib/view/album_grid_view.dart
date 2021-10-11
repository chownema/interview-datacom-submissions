import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_base/bloc/album_bloc.dart';
import 'package:gallery_base/models/photo.dart';
import 'package:gallery_base/bloc/events.dart';
import 'package:gallery_base/bloc/states.dart';
import 'package:gallery_base/view/detail_photo_view.dart';

class AlbumGridView extends StatefulWidget {
  num albumId;
  String albumTitle;
  AlbumGridView({Key? key, this.albumId = 0, this.albumTitle = ''}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AlbumGridViewState(this.albumId, this.albumTitle);
}

class AlbumGridViewState extends State<AlbumGridView> {
  num albumId;
  String albumTitle;
  AlbumGridViewState(this.albumId, this.albumTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Album ${this.albumTitle}'),
        ),
        body: BlocBuilder<AlbumBloc, StateBase>(builder: (context, state) {
          switch (state.runtimeType) {
            case UninitialisedState:
              context.read<AlbumBloc>().add(EventPullList(id: this.albumId));
              return Center( child: CircularProgressIndicator(),);
              break;
            case InitialisingState:
              return Center( child: CircularProgressIndicator(),);
              break;
            case GetAlbumThumbnailListState:
              List<Photo> _items = (state as GetAlbumThumbnailListState).photoList;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 3,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          DetailPhotoView(
                              photo: _items[index]),
                        ),
                      );
                    },
                    child: Hero(
                      child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_items[index].thumbnailUrl),
                        ),
                      ),
                    ),
                      tag: 'photo-tag-${_items[index].id}',
                  ),);
                },
              );
              break;
            case ErrorState:
            String message = (state as ErrorState).message;
                return GestureDetector(onTap: () {
                  context.read<AlbumBloc>().add(EventPullList(id: this.albumId));
                },
                child: Center(child: Text(message)),
              );
            default:
              context.read<AlbumBloc>().add(EventPullList(id: this.albumId));
              return Text('Uninitialised');
          }
        }));
  }
}
