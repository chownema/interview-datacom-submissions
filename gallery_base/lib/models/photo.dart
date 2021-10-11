class Photo {
  num id;
  num albumId;
  String title;
  String url;
  String thumbnailUrl;

  List<String> schema;

  Photo(
    {
    this.id = 0,
    this.albumId = 0,
    this.title = '',
    this.url = '',
    this.thumbnailUrl = '',
    this.schema = const ['id', 'albumId', 'title', 'url', 'thumbnailUrl'],
    }
  );
  
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'albumId': this.albumId,
      'title': this.title != null ? this.title.toString() : null,
      'url': this.url != null ?  this.url.toString() : null,
      'thumbnailUrl': this.thumbnailUrl != null ? this.thumbnailUrl : null,
    };
  }
  fromJson(Map<String, dynamic> json) {
    if (json != null) {
      this.id = json['id'] as num;
      this.albumId = json['albumId'] as num;
      this.title = json['title'] as String;
      this.url = json['url'] as String;
      this.thumbnailUrl = json['thumbnailUrl'] as String;
    }
  }

}