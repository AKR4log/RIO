// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Create a gift request
create_application_gift_user(int gift_catalog_id) async {
  final token = getToken();
  final res = await http.post(
      api_link_application_gift_user.replace(queryParameters: {
        "gift_catalog_id": gift_catalog_id,
      }),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      encoding: encoding);
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    print(json);
    setToken(json['token']);
  }
}
