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

 // BookModel.cartBookList = [
    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp2hmVoM_vMrFcJOTuQrhq0GQgrDCMlhLv3ei54PHq&s',
    //     rating: 4,
    //     title: 'qwwylkjhgfdsazxcvm,.m',
    //     author: 'cart',
    //     description: 'idkjndlkdjfnv;kjn',
    //     price: 5,
    //     id: 0,
    //     language: '',
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80',
    //     rating: 5,
    //     title: ' ddddd dddddddddddddd dddddddddddd',
    //     author: 'cart',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-JUjJifI_U5X-Fp_G1fEdrYozUuK4j0FgkBbIfKE&s',
    //     rating: 5,
    //     title: 'how is FAIR',
    //     author: 'NEW',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    // ];
