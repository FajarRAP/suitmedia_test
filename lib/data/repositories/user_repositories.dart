import 'dart:convert';

import 'package:http/http.dart';
import 'package:suitmedia_test/data/models/user_model.dart';

class UserRepositories {
  Future<List<User>> getUsers(int page, int numContent) async {
    final response =
        await get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=$numContent'));
    if (response.statusCode == 200) {
      final responseDecoded = jsonDecode(response.body);
      final List<User> datas = (responseDecoded['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
      return datas;
    }
    throw Exception('Gagal Mengambil Data');
  }
}
