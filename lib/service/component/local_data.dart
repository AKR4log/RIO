// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

final encoding = Encoding.getByName('utf-8');

/// User authorization link
final api_link_auth = Uri.parse('http://37.143.15.244/api/v1/auth/login');
final api_link_auth_check =
    Uri.parse('http://37.143.15.244/api/v1/auth/sms_check');

/// Link to get authorized user data
final api_link_get_data_user = Uri.parse('http://37.143.15.244/api/v1/me');

/// Link to get data about the history of an authorized user
final api_link_get_history_user =
    Uri.parse('http://37.143.15.244/api/v1/points_history');
final api_link_get_catalogy_gift =
    Uri.parse('http://37.143.15.244/api/v1/gift_catalog');
final api_link_get_bonus_user =
    Uri.parse('http://37.143.15.244/api/v1/bonus_point');
final api_link_application_gift_user =
    Uri.parse('http://37.143.15.244/api/v1/gift_application');
