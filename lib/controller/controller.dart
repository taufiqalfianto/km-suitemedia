import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kamppus_merdeka/model/model.dart';

class UserController extends GetxController {
  RxList<UserModel> users = <UserModel>[].obs;

  Future<void> fetchUsers({int page = 1, int perPage = 10}) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<UserModel> userList =
          data.map((e) => UserModel.fromJson(e)).toList();
      users.addAll(userList);
    }
  }
}
