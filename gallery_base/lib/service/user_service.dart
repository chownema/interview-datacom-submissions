import 'package:gallery_base/models/album.dart';
import 'package:gallery_base/models/user.dart';

class UserService {
  static List<Album> mapUserDataToAlbum(List<User> user_list, List<Album> album_list) {
    return album_list.map((album_el) {
      User user = user_list.firstWhere((user_el) => album_el.userId == user_el.id);
      album_el.name_of_user = user != null ? user.name : '';
      return album_el;
    }).toList();
  }
}