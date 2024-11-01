import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/util/env_utils.dart';
import 'package:tots_test/util/http_utils.dart';

class ApiService {
  final String _baseUrl = Env.baseUrl;

  /// Authentication - Obtain a token
  Future<AuthModelResponse> authenticate({required AuthRequest request}) async {
    final url = Uri.parse('$_baseUrl/oauth/token');
    final body = request.toJson();

    final response = await http.post(
      url,
      headers: HttpUtils.headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Handle success
      return AuthModelResponse.fromJson(jsonDecode(response.body));
    } else {
      // Handle error
      throw Exception('Failed to authenticate: ${response.statusCode}');
    }
  }

  /// Register a new user
  Future<http.Response> registerUser(
      {required String email,
      required String password,
      required String firstname}) async {
    final url = Uri.parse('$_baseUrl/users');
    final body = jsonEncode({
      "email": email,
      "password": password,
      "firstname": firstname,
    });

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 201) {
      // Handle success
      return response;
    } else {
      // Handle error
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }
}
