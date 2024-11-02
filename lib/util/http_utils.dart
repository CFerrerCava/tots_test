import 'dart:convert';

import 'package:http/http.dart';
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/services/hive_service.dart';
import 'package:tots_test/util/env_utils.dart';
import 'package:http/http.dart' as http;

class HttpUtils {
  final _hiveService = locator<HiveService>();

  final String _baseUrl = Env.baseUrl;

  Future<String> get _authToken async =>
      (await _hiveService.getAuthModel())?.accessToken ?? '';

  static Map<String, String> get _headers =>
      {"Content-Type": "application/json"};

  Future<Map<String, String>> authHeaders({bool withAuth = false}) async {
    if (withAuth) {
      _headers.addAll({'Authorization': await _authToken});
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
    return await http.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
  }

  Future<Response> httpPut({
    bool withAuth = false,
    required dynamic request,
    required String path,
  }) async {
    final url = Uri.parse('$_baseUrl$path');
    final headers = await authHeaders(withAuth: withAuth);
    return await http.put(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
  }

  Future<Response> httpDelete({
    bool withAuth = false,
    required String path,
  }) async {
    final url = Uri.parse('$_baseUrl$path');
    final headers = await authHeaders(withAuth: withAuth);
    return await http.delete(url, headers: headers);
  }
}
