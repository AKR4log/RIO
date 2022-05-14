// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Request for one category of gift
Future get_catalogy_gift_user(String id) async {
  final token = getToken();
  final res = await http.get(
      api_link_get_catalogy_gift.replace(queryParameters: {"id": id}),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }
}

/// Request for all categories of gifts
Future<dynamic> gets_catalogy_gift_user(String page) async {
  final token = await getToken();
  final res = await http.get(
      api_link_get_catalogy_gift.replace(queryParameters: {"page": page}),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }
}
