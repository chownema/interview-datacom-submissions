class HelperService {
  static bool isJsonMatchSchema(Map<String, dynamic> json, [list_schema = const []]) {
    return list_schema.where((e) => json.containsKey(e)).toList().length ==
        list_schema.length;
  }
}