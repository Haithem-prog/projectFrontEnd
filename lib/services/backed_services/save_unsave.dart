import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';

class SaveUnsave {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late int id;
  static late String message;
  static saveUnsaveBook(int bookId, bool saveCondiction) async {
    id = AuthService.id;
    try {
      response = await dio.get('http://10.0.2.2:8000/api/save_unsave_book/$id/$bookId/$saveCondiction',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      message = response.data['msg'];
    } catch (e) {
      return e;
    }
  }
}
