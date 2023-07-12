import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kamppus_merdeka/model/model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<List<Data>> getUsers(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Data.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
