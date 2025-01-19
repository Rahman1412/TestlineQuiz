import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';



class ApiService {
  final String baseUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map<String, dynamic>) {
        return jsonResponse;
      } else {
        throw Exception('Invalid JSON structure: Expected a JSON object.');
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
