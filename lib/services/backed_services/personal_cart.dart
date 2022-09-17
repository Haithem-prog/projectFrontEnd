import 'dart:convert';

import 'package:book_store/services/backed_services/auth.dart';
import 'package:dio/dio.dart';

class GetPersonalCart {
  static final dio = Dio();
  static late Response response;
  static String token = AuthService.token;
  static late int id;
  static late List<dynamic> cartBody;
  static late Map<String, dynamic> cartTotals;
  static late bool thereIsItems;
  static late String message;
  static getCartItems() async {
    id = AuthService.id;
    try {
      response = await dio.get('http://10.0.2.2:8000/api/get_personal_cart/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 201) {
        thereIsItems = false;
      } else {
        thereIsItems = true;
        cartBody = response.data;
        print(cartBody[1]['qty']);
      }
    } catch (e) {
      print(e);
    }
  }

  static late Response cartTotalsBody;
  static getCartTotals() async {
    try {
      cartTotalsBody = await dio.get('http://10.0.2.2:8000/api/get_total_items_price_and_qty/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      cartTotals = cartTotalsBody.data;
    } catch (e) {
      print(e);
    }
  }

  static addItemToCart(int bookId, int qty, bool cartCondition) async {
    try {
      response = await dio.post('http://10.0.2.2:8000/api/add_remove_cart_items',
          data: jsonEncode(
            {
              "user_id": id,
              "book_id": bookId,
              "qty": qty,
              "removeFromCart": cartCondition,
            },
          ),
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));

      message = response.data['msg'];
    } catch (e) {
      print(e);
    }
  }
}
