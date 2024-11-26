import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<dynamic> postData(String url, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to post data");
    }
  }
}