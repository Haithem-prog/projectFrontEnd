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
      response = await dio.get('https://haithemali1.pythonanywhere.com/api/get_personal_cart_items/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 201) {
        thereIsItems = false;
      } else {
        thereIsItems = true;
        cartBody = response.data;
      }
    } catch (e) {
      return(e);
    }
  }

  static late Response cartTotalsBody;
  static getCartTotals() async {
    try {
      cartTotalsBody = await dio.get('https://haithemali1.pythonanywhere.com/api/get_total_items_price_and_qty/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      cartTotals = cartTotalsBody.data;
    } catch (e) {
      return(e);
    }
  }

  static addItemToCart(int bookId, int qty, bool cartCondition) async {
    try {
      response = await dio.post('https://haithemali1.pythonanywhere.com/api/add_remove_cart_items',
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
      return(e);
    }
  }

  static buyItemsInCart() async {
    try {
      response = await dio.get('https://haithemali1.pythonanywhere.com/api/Buy_items/$id',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      message = response.data['msg'];
    } catch (e) {
      return(e);
    }
  }
}
