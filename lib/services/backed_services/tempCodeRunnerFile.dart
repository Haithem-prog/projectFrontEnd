import 'dart:convert';

import 'package:dio/dio.dart';

class AuthService {
  static signIn() async {
    try {
      dynamic res = await Dio().get(
        'https://haithemali1.pythonanywhere.com/api/get_all_books',
      );
    } catch (e) {
      return(e);
    }
  }
}
