import 'package:gallery_base/models/album.dart';
import 'package:gallery_base/models/photo.dart';
import 'package:gallery_base/models/user.dart';
import 'package:test/test.dart';
import 'album_service.dart';

void main() {
  test('AlbumService has the expected members', ()  {
    expect(AlbumService.decodeJson != Null, equals(true));
    expect(AlbumService.decodeAlbumListJson != Null, equals(true));
    expect(AlbumService.decodeUserListJson != Null, equals(true));
    expect(AlbumService.decodePhotoListJson != Null, equals(true));
    expect(AlbumService.getAllAblumList != Null, equals(true));
    expect(AlbumService.getAllUserList != Null, equals(true));
    expect(AlbumService.getAllPhotoList != Null, equals(true));
  });
  test('AlbumService can decode Json String to Map', ()  {
    var json_string  = '[{ "userId": 1, "id": 1, "title": "quidem molestiae enim" }, { "userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa" } ]';
    var res = AlbumService.decodeJson(json_string);
    List<Map<String, dynamic>> expect_type_obj = [];
    expect(res.runtimeType == expect_type_obj.runtimeType, equals(true));
    expect(res != Null, equals(true));
    expect(res.length == 2, equals(true));
  });
  test('AlbumService can decode Json String to AlbumList', () {
    var json_string =
        '[{ "userId": 1, "id": 1, "title": "quidem molestiae enim" }, { "userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa" } ]';
    var json_res = AlbumService.decodeJson(json_string);
    var res = AlbumService.decodeAlbumListJson(json_res);
    List<Album> expect_type_obj = [];
    expect(res.runtimeType == expect_type_obj.runtimeType, equals(true));
    expect(res != Null, equals(true));
    expect(res.length == 2, equals(true));
  });
  test('AlbumService can decode Json String to UserList', () {
    var json_string = '[{ "id": 1, "name": "Leanne Graham", "username": "Bret", "email": "Sincere@april.biz", "address": { "street": "Kulas Light", "suite": "Apt. 556", "city": "Gwenborough", "zipcode": "92998-3874", "geo": { "lat": "-37.3159", "lng": "81.1496" } }, "phone": "1-770-736-8031 x56442", "website": "hildegard.org", "company": { "name": "Romaguera-Crona", "catchPhrase": "Multi-layered client-server neural-net", "bs": "harness real-time e-markets" } }, { "id": 2, "name": "Ervin Howell", "username": "Antonette", "email": "Shanna@melissa.tv", "address": { "street": "Victor Plains", "suite": "Suite 879", "city": "Wisokyburgh", "zipcode": "90566-7771", "geo": { "lat": "-43.9509", "lng": "-34.4618" } }, "phone": "010-692-6593 x09125", "website": "anastasia.net", "company": { "name": "Deckow-Crist", "catchPhrase": "Proactive didactic contingency", "bs": "synergize scalable supply-chains" } }]';
    var json_res = AlbumService.decodeJson(json_string);
    var res = AlbumService.decodeUserListJson(json_res);
    List<User> expect_type_obj = [];
    expect(res.runtimeType == expect_type_obj.runtimeType, equals(true));
    expect(res != Null, equals(true));
    expect(res.length == 2, equals(true));
  });
  test('AlbumService can decode Json String to PhotoList', () {
    var json_string = ' [ { "albumId": 1, "id": 1, "title": "accusamus beatae ad facilis cum similique qui sunt", "url": "https://via.placeholder.com/600/92c952", "thumbnailUrl": "https://via.placeholder.com/150/92c952" }, { "albumId": 1, "id": 2, "title": "reprehenderit est deserunt velit ipsam", "url": "https://via.placeholder.com/600/771796", "thumbnailUrl": "https://via.placeholder.com/150/771796" }]';
    var json_res = AlbumService.decodeJson(json_string);
    var res = AlbumService.decodePhotoListJson(json_res);
    List<Photo> expect_type_obj = [];
    expect(res.runtimeType == expect_type_obj.runtimeType, equals(true));
    expect(res != Null, equals(true));
    expect(res.length == 2, equals(true));
  });
}