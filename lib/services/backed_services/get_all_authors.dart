import 'dart:convert';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';


class GetAllAuthors {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> authorsBody;
  static getAuthors() async {
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_all_authors',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      authorsBody = response.data;
    } catch (e) {
      return(e) ;
    }
  }
}