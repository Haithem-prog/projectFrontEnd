import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';

class GetNewArrivalBooks {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> booksBody;
  static getBooks() async {
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_10top_new_arrival',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
     booksBody = response.data;
    } catch (e) {
      return e;
    }
  }
}


class GetTopRatedBooks {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> booksBody;
  static getBooks() async {
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_10top_rated',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
     booksBody = response.data;
    } catch (e) {
      return e;
    }
  }
}


class GetTopSellerBooks {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late List<dynamic> booksBody;
  static getBooks() async {
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_10top_sales',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
     booksBody = response.data;
    } catch (e) {
      return e;
    }
  }
}
