// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Request to get data about the history of an authorized user
get_history_user() async {
  final token = getToken();
  final res = await http.get(api_link_get_history_user, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    print(json);
  }
}
