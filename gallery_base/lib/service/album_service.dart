import 'package:gallery_base/gateway/api_gateway.dart';
import 'package:gallery_base/models/album.dart';
import 'package:gallery_base/models/user.dart';
import 'package:gallery_base/models/photo.dart';
import 'package:gallery_base/service/helper_service.dart';
import 'dart:convert';

class AlbumService {
  static List<Map<String, dynamic>> decodeJson(String json_string) {
    try {
      List<dynamic> res = jsonDecode(json_string);
      List<Map<String, dynamic>> pRes =
          res.map((e) => e as Map<String, dynamic>).toList();
      return pRes;
    } catch (e) {
      throw e;
    }
  }

  static List<Album> decodeAlbumListJson(
      List<Map<String, dynamic>> parsed_json) {
    List<Album> pRes = parsed_json
        .where((e) => HelperService.isJsonMatchSchema(e, Album().schema))
        .map((e) => Album()..fromJson(e))
        .toList();
    return pRes;
  }

  static List<User> decodeUserListJson(List<Map<String, dynamic>> parsed_json) {
    List<User> pRes = parsed_json
        .where((e) => HelperService.isJsonMatchSchema(e, User().schema))
        .map((e) => User()..fromJson(e))
        .toList();
    return pRes;
  }

  static List<Photo> decodePhotoListJson(
      List<Map<String, dynamic>> parsed_json) {
    List<Photo> pRes = parsed_json
        .where((e) => HelperService.isJsonMatchSchema(e, Photo().schema))
        .map((e) => Photo()..fromJson(e))
        .toList();
    return pRes;
  }

  static Future<List<Album>> getAllAblumList() async {
    String gatewayRes = await ApiGateway.getAlbumList();
    List<Map<String, dynamic>> decodedRes = AlbumService.decodeJson(gatewayRes);
    return AlbumService.decodeAlbumListJson(decodedRes);
  }

  static Future<List<User>> getAllUserList() async {
    String gatewayRes = await ApiGateway.getUserlist();
    List<Map<String, dynamic>> decodedRes = AlbumService.decodeJson(gatewayRes);
    return AlbumService.decodeUserListJson(decodedRes);
  }

  static Future<List<Photo>> getAllPhotoList() async {
    String gatewayRes = await ApiGateway.getPhotoList();
    List<Map<String, dynamic>> decodedRes = AlbumService.decodeJson(gatewayRes);
    return AlbumService.decodePhotoListJson(decodedRes);
  }
}