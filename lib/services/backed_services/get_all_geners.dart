import 'dart:convert';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';


class GetAllGenres {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> genresBody;
  static getGenres() async {
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_all_genres',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      genresBody = response.data;
    } catch (e) {
      print(e) ;
    }
  }
}