// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rio/service/component/database.dart';
import 'package:rio/service/component/local_data.dart';

import '../../../page/connect/comfirm_phone.dart';

/// User authorization request
auth_user(String phone, BuildContext context) async {
  // final deviceInfoPlugin = DeviceInfoPlugin();
  // final deviceInfo = await deviceInfoPlugin.deviceInfo;
  // final map = deviceInfo.toMap();

  final res = await http.post(
      api_link_auth.replace(queryParameters: {
        "phone": phone,
        "device_name": 'device_name',
      }),
      headers: {
        'Accept': 'application/json',
      },
      encoding: encoding);
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);
    setToken(json['data']['token']).whenComplete(() => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ComfirmPhone())));
  }
}
