import 'package:flutter/material.dart';
import 'package:gallery_base/models/photo.dart';

class DetailPhotoView extends StatelessWidget {
  final Photo photo;
  DetailPhotoView({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${this.photo.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  child: Container(
                    width: double.infinity,
                      child:
                        Image.network(
                        photo.url,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return child;
                          }
                        },
                      ),
                    ),
                  tag: 'photo-tag-${this.photo.id}',
                )
              ),
            ],
          ),
        ));
  }
}
