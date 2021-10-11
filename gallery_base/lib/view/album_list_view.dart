import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_base/bloc/album_bloc.dart';
import 'package:gallery_base/bloc/album_list_bloc.dart';
import 'package:gallery_base/bloc/events.dart';
import 'package:gallery_base/bloc/states.dart';
import 'package:gallery_base/models/album.dart';
import 'album_grid_view.dart';

class AlbumListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlbumListViewState();
}

class AlbumListViewState extends State<AlbumListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Albums'),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<AlbumListBloc, StateBase>(builder: (context, state) {
          print(state.runtimeType);
          switch (state.runtimeType) {
            case UninitialisedState:
              context.read<AlbumListBloc>().add(EventPullList());
              return Center( child: CircularProgressIndicator(),);
              break;
            case InitialisingState:
              return Center( child: CircularProgressIndicator(),);
              break;
            case GetAlbumListState:
              List<Album> _items = (state as GetAlbumListState).albumList;
              return RefreshIndicator(
                child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text('${_items[index].title} - ${_items[index].name_of_user}'),
                    onTap: ()  {
                      context.read<AlbumBloc>().add(EventPullList(id: _items[index].id));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumGridView(albumId: _items[index].id, albumTitle: _items[index].title,),
                        ),
                      );
                    },
                  ));
                },
              ),
              onRefresh: () {
                  context.read<AlbumListBloc>().add(EventPullList());
                  return Future.delayed(Duration(seconds: 1), () {
                  });
                },
              );
              break;
            case ErrorState:
            String message = (state as ErrorState).message;
                return GestureDetector(onTap: () {
                  context.read<AlbumListBloc>().add(EventPullList());
                },
                child: Center(child: Text(message)),
              );
            default:
              context.read<AlbumListBloc>().add(EventPullList());
              return Center( child: CircularProgressIndicator(),);
          }
        })
        );
  }
}
