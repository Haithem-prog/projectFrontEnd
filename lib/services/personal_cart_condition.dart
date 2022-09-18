import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:get/get.dart';

class GetPersonalCartBooksAndTotals {
  static late int totalQty;
  static late String totalPrice;

  static getCart() async {
    await GetPersonalCart.getCartItems();
    CartModel.cartBookList = [];
    if (GetPersonalCart.thereIsItems == true) {
      List<dynamic> data = GetPersonalCart.cartBody;
      CartModel.cartBookList = [];
      for (int i = 0; i < data.length; i++) {
        CartModel.cartBookList.add(CartModel(
          imageUrl: data[i]['book']['bookImageUrl'].toString(),
          rating: double.parse(data[i]['book']['rate']),
          title: data[i]['book']['name'],
          author: data[i]['book']['author']['name'],
          price: double.parse(data[i]['book']['price']),
          description: (data[i]['book']['description']).toString(),
          language: data[i]['book']['language'],
          pages: data[i]['book']['pages'],
          id: (data[i]['book']['id']),
          qty: data[i]['qty'],
          saved: saveChecker(data[i]['book']['id']),
        ));
      }
    }

    await GetPersonalCart.getCartTotals();
    Map<String, dynamic> data1 = GetPersonalCart.cartTotals;
    totalQty = data1['totalqty'];
    totalPrice = (data1['totalPrice']).toString();
  }
}

