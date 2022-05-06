// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Request for one category of gift
get_catalogy_gift_user(String id) async {
  final token = getToken();
  final res = await http.get(
      api_link_get_catalogy_gift.replace(queryParameters: {
        "id": id,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    print(json);
  }
}

/// Request for all categories of gifts
gets_catalogy_gift_user(int page) async {
  final token = getToken();
  final res = await http.get(
      api_link_get_catalogy_gift.replace(queryParameters: {
        "page": page,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    print(json);
  }
}
