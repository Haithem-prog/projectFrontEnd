import 'dart:convert';

import 'package:dio/dio.dart';

class AuthService {
  static signIn() async {
    try {
      dynamic res = await Dio().get(
        'http://10.0.2.2:8000/api/get_all_books',
        //data: jsonEncode({"email": "Developer5@gmail.com", "password": 123456}),
      );
      print(res);
    } catch (e) {
      print('----------------------------------------------------------------------------------');
      print(e);
    }
  }
}
