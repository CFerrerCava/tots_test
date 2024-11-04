import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tots_test/app/app.locator.dart';
import 'package:tots_test/models/auth_model_request.dart';
import 'package:tots_test/models/auth_model_response.dart';
import 'package:tots_test/models/client_model.dart';
import 'package:tots_test/models/get_clients_response.dart';
import 'package:tots_test/models/register_user_request.dart';
import 'package:tots_test/models/register_user_response.dart';
import 'package:tots_test/services/hive_service.dart';
import 'package:tots_test/util/env_utils.dart';
import 'package:tots_test/util/http_extension.dart';
import 'package:tots_test/util/http_utils.dart';

class ApiService {
  final String _baseUrl = Env.baseUrl;
  final _hiveService = locator<HiveService>();
  final _httpUtil = HttpUtils();

  /// Authentication - Obtain a token
  Future<dynamic> authenticate(AuthRequest request) async {
    try {
      final response =
          await _httpUtil.httpPost(request: request, path: '/oauth/token');

      if (response.isCreated) {
        // Handle success
        final authResponse =
            AuthModelResponse.fromJson(jsonDecode(response.body));
        _hiveService.saveAuthModel(authResponse);
        return authResponse;
      } else {
        // Handle error
        return Exception('Failed to authenticate: ${response.statusCode}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  /// Register a new user
  Future<dynamic> registerUser(RegisterUserRequest request) async {
    try {
      final response =
          await _httpUtil.httpPost(request: request, path: '/users');

      if (response.isCreated) {
        // Handle success
        return RegisterUserResponse.fromJson(jsonDecode(response.body));
      } else {
        // Handle error
        return Exception('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  Future<dynamic> getClients() async {
    final url = Uri.parse('$_baseUrl/clients');
    try {
      final headers = await HttpUtils().authHeaders(withAuth: true);
      final response = await http.get(url, headers: headers);

      if (response.isCompleted) {
        return GetClientsResponse.fromJson(jsonDecode(response.body));
      } else {
        return Exception('Failed to fetch clients: ${response.body}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  Future<dynamic> createClient(ClientsModel request) async {
    try {
      final response = await _httpUtil.httpPost(
          request: request, withAuth: true, path: '/clients');

      if (response.isCreated) {
        return jsonDecode(response.body);
      } else {
        return Exception('Failed to fetch clients: ${response.body}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  Future<dynamic> updateClient(ClientsModel request) async {
    try {
      final response = await _httpUtil.httpPut(
          request: request, withAuth: true, path: '/clients/${request.id}');

      if (response.isCompleted) {
        return jsonDecode(response.body);
      } else {
        return Exception('Failed to fetch clients: ${response.body}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  Future<dynamic> getClient(int id) async {
    final url = Uri.parse('$_baseUrl/clients/$id');
    try {
      final response = await http.get(
        url,
        headers: await HttpUtils().authHeaders(withAuth: true),
      );

      if (response.isCompleted) {
        return ClientsModel.fromJson(jsonDecode(response.body));
      } else {
        return Exception('Failed to fetch : ${response.body}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }

  Future<dynamic> deleteClient(int id) async {
    try {
      final response =
          await _httpUtil.httpDelete(withAuth: true, path: '/clients/$id');

      if (response.isCompleted) {
        return jsonDecode(response.body);
      } else {
        return Exception('Failed to fetch clients: ${response.body}');
      }
    } catch (e) {
      return Exception('Failed to authenticate: $e');
    }
  }
}
