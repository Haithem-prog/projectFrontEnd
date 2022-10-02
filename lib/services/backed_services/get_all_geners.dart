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
      response = await dio.get('https://haithemali1.pythonanywhere.com/api/get_all_genres',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      genresBody = response.data;
    } catch (e) {
      return(e) ;
    }
  }
}