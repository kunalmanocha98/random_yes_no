import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkUtils {

  Future<dynamic> fetchData(String url) async {
    var res = await http.get(url);
    return jsonDecode(res.body);
  }
}