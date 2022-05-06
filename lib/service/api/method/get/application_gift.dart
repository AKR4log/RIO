// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Gift requests
get_application_gift_user(String id) async {
  final token = getToken();
  final res = await http.get(
      api_link_application_gift_user.replace(queryParameters: {
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

/// Gift Applications
gets_application_gift_user(int page, String status) async {
  final token = getToken();
  final res = await http.get(
      api_link_application_gift_user.replace(queryParameters: {
        "page": page,
        "status": status,
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
