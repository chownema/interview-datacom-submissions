import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_base/bloc/album_list_bloc.dart';
import 'package:gallery_base/bloc/album_bloc.dart';
import 'view/album_list_view.dart';
import 'view/album_grid_view.dart';
import 'bloc/states.dart';

void main() async {
  runApp(
    MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumListBloc>(
          create: (BuildContext context) => AlbumListBloc(UninitialisedState()),
        ),
        BlocProvider<AlbumBloc>(
          create: (BuildContext context) => AlbumBloc(UninitialisedState()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AlbumListBloc, StateBase>(
            listener: (context, state) {
              // print('AuthBloc Listener ${state.toString()}');
            },
          ),
          BlocListener<AlbumBloc, StateBase>(
            listener: (context, state) {
              // print('AuthBloc Listener ${state.toString()}');
            },
          ),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
        '/': (context) => AlbumListView(),
        '/album_grid': (context) => AlbumGridView(),
      }),
      )
    );
  }

}
