// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rio/page/connect/confirm_card.dart';
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

/// User authorization request
check_code(String phone, String code, BuildContext context) async {
  final res = await http.post(
      api_link_auth_check.replace(queryParameters: {
        "phone": phone,
        "code": code,
      }),
      headers: {
        'Accept': 'application/json',
      },
      encoding: encoding);
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    setToken(json['data']['access_token']).whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ComfirmCard())));
  }
}
