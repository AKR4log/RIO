// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// Request for obtaining data of an authorized user
Future<String> get_data_card_user() async {
  var token = await getToken();
  final res = await http.get(api_link_get_data_user, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    return json['data']['card'];
  }
}

Future get_data_balance_user() async {
  var token = await getToken();
  final res = await http.get(api_link_get_data_user, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    return json['data']['balance'];
  }
}
