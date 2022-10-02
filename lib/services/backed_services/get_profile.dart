import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';

class GetAllPurchasedBooks {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static int? id;
  static late bool thereIsItems;

  static late List<dynamic> booksBody;
  static getBooks() async {
    try {
      id = AuthService.id;
      response = await dio.get('https://haithemali1.pythonanywhere.com/api/get_all_purchased_books/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 201) {
        thereIsItems = false;
      } else {
        thereIsItems = true;
        booksBody = response.data;
      }
      //print(booksBody);
    } catch (e) {
      return e;
    }
  }
}
