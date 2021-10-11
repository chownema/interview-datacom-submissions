class User {
  num id;
  String name;

  List<String> schema;

  User(
    {
    this.id = 0,
    this.name = '',
    this.schema = const ['id', 'name'],
    }
  );
  
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name != null ? this.name.toString() : null,
    };
  }
  fromJson(Map<String, dynamic> json) {
    if (json != null) {
      this.id = json['id'] as num;
      this.name = json['name'] as String;
    }
  }
}