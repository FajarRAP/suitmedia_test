import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:suitmedia_test/data/models/user_model.dart';

import 'package:suitmedia_test/main.dart';

void main() {
  test(
    'get users',
    () async {
      // Act
      final response = await get(
          Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));
      final responseDecoded = jsonDecode(response.body);
      final List<User> datas = (responseDecoded['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
      // Assert
      expect(datas, isA<List<User>>());
    },
  );
}
