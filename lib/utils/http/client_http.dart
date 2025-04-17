import 'dart:convert';

import 'package:http/http.dart' as http;

class JHttpHelper {
  static String baseUrl =
      "www.example.com"; //it will be replaced with actual api

  //helper method to make a get request

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //helper method for POST method

  static Future<Map<String, dynamic>> post(
    String endpoint,
    dynamic data,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  //helper method for PUT method

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> _handleResponse(http.Response response) {
    if (response == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('failed to load: ${response.statusCode}');
    }
  }
}
