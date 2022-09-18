import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:dio/dio.dart';

class GetSaved {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late int id;
  static late List<dynamic> booksBody;
  static late bool noSavedBook;
  static getSavedBooks() async {
    id = AuthService.id;
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_all_saved_books/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      booksBody = response.data;
      if (booksBody.toString() == "[]") {
        noSavedBook = true;
      } else {
        noSavedBook = false;
      }
      print('saved');
    } catch (e) {
      print(e);
    }
  }
}
