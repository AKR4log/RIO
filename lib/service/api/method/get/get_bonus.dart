// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Bonus Point Request
get_bonus_user(String id) async {
  final token = getToken();
  final res = await http.get(
      api_link_get_bonus_user.replace(queryParameters: {
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

/// Reward points request
gets_bonus_user(String page) async {
  final token = await getToken();
  final res = await http.get(
      api_link_get_bonus_user.replace(queryParameters: {
        "page": page,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }
}
