import 'package:test/test.dart';
import 'api_gateway.dart';

void main() {
  test('ApiGateway expected members exist', () {
    expect(ApiGateway.getAlbumList != Null, equals(true));
    expect(ApiGateway.getUserlist != Null, equals(true));
    expect(ApiGateway.getPhotoList != Null, equals(true));
  });

  test('ApiGateway can request for users', () async {
    var res = await ApiGateway.getUserlist();
    expect(res != Null, equals(true));
    expect(res.runtimeType == String, equals(true));
    expect(res != '{}', equals(true));
  });

  test('ApiGateway can request for albums', () async {
    var res = await ApiGateway.getAlbumList();
    expect(res != Null, equals(true));
    expect(res.runtimeType == String, equals(true));
    expect(res != '{}', equals(true));
  });

  test('ApiGateway can request for photos', () async {
    var res = await ApiGateway.getUserlist();
    expect(res != Null, equals(true));
    expect(res.runtimeType == String, equals(true));
    expect(res != '{}', equals(true));
  });
}