import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/get_profile.dart';
import 'package:get/get.dart';

class GetPurchasedBooks {
  static Rx<int> refresh = 0.obs;
  static getAllPurchasedBooks() async {
    await GetAllPurchasedBooks.getBooks();
    BookModel.purchasedBookList = [];
    if (GetAllPurchasedBooks.thereIsItems == true) {
      List<dynamic> data = GetAllPurchasedBooks.booksBody;
      BookModel.purchasedBookList = [];
      for (int i = 0; i < data.length; i++) {
        BookModel.purchasedBookList.add(BookModel(
          imageUrl: data[i]['book']['bookImageUrl'].toString(),
          rating: double.parse(data[i]['book']['rate']),
          title: data[i]['book']['name'],
          author: data[i]['book']['author']['name'],
          price: double.parse(data[i]['book']['price']),
          description: (data[i]['book']['description']).toString(),
          language: data[i]['book']['language'],
          pages: data[i]['book']['pages'],
          id: (data[i]['book']['id']),
          saved: saveChecker(data[i]['book']['id']),
        ));
      }
    }
    refresh.value = 1;
  }
}
