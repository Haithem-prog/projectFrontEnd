import 'dart:convert';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';

class GetAllBooks {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> booksBody;
  static getBooks() async {
    try {
      response = await dio.get('https://haithemali1.pythonanywhere.com/api/get_all_books',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      booksBody = response.data;
    } catch (e) {
      return e;
    }
  }
}
