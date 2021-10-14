import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiGateway {
  static final base_url = 'https://jsonplaceholder.typicode.com';
  static final album_ext = 'albums';
  static final user_ext = 'users';
  static final photo_ext = 'photos';
  static final timeout = 30;

  static Future<String> getUserlist() async {
    try {
      final response = await http
          .get(Uri.parse('${ApiGateway.base_url}/${ApiGateway.user_ext}'))
          .timeout(Duration(seconds: ApiGateway.timeout));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load UserList, got code ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      throw e;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      throw e;
    } catch (e) {
      print('General Error: $e');
      throw e;
    }
  }

  static Future<String> getPhotoList() async {
    try {
      final response = await http
          .get(Uri.parse('${ApiGateway.base_url}/${ApiGateway.photo_ext}'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load PhotoList, got code ${response.statusCode}');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<String> getAlbumList() async {
    try {
      final response = await http
          .get(Uri.parse('${ApiGateway.base_url}/${ApiGateway.album_ext}'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load AlbumList, got code ${response.statusCode}');
      }
    } catch (e) {
      throw e;
    }
  }
}
