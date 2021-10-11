class Album {
  num id;
  num userId;
  String title;
  
  String name_of_user;

  List<String> schema;

  Album(
    {
    this.id = 0,
    this.userId = 0,
    this.title = '',
    this.name_of_user = '',
    this.schema = const ['id', 'userId', 'title'],
    }
  );
  
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'userId': this.userId,
      'title': this.title != null ? this.title.toString() : null,
    };
  }
  fromJson(Map<String, dynamic> json) {
    if (json != null) {
      this.id = json['id'] as num;
      this.userId = json['userId'] as num;
      this.title = json['title'] as String;
    }
  }

}