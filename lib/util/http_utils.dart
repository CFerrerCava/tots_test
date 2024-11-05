import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/services/hive_service.dart';
import 'package:tots_test/util/env_utils.dart';
import 'package:http/http.dart' as http;

class HttpUtils {
  final _hiveService = locator<HiveService>();

  final String _baseUrl = Env.baseUrl;

  Future<String> getAuthToken() async =>
      (await _hiveService.getAuthModel())?.accessToken ?? '';

  final Map<String, String> _headers = {"Content-Type": "application/json"};

  Future<Map<String, String>> authHeaders({bool withAuth = false}) async {
    if (withAuth) {
      final authToken = await getAuthToken();
      _headers['Authorization'] = authToken;
    }
    return _headers;
  }

  Future<Response> httpPost({
    bool withAuth = false,
    required dynamic request,
    required String path,
  }) async {
    final url = Uri.parse('$_baseUrl$path');
    final headers = await authHeaders(withAuth: withAuth);
    debugPrint('request: $url /n headers: $headers');
    return await http
        .post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    )
        .then((onValue) {
      debugPrint('response: ${onValue.body}');
      return onValue;
    });
  }

  Future<Response> httpPut({
    bool withAuth = false,
    required dynamic request,
    required String path,
  }) async {
    final url = Uri.parse('$_baseUrl$path');
    final headers = await authHeaders(withAuth: withAuth);
    debugPrint('request: $url /n headers: $headers');
    return await http
        .put(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    )
        .then((onValue) {
      debugPrint('response: ${onValue.body}');
      return onValue;
    });
  }

  Future<Response> httpDelete({
    bool withAuth = false,
    required String path,
  }) async {
    final url = Uri.parse('$_baseUrl$path');
    final headers = await authHeaders(withAuth: withAuth);
    debugPrint('request: $url /n headers: $headers');
    return await http.delete(url, headers: headers).then((onValue) {
      debugPrint('response: ${onValue.body}');
      return onValue;
    });
  }
}
