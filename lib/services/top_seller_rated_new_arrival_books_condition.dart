import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/get_top_rated_seller_new_arrival.dart';
import 'package:get/get.dart';

class GetTopSellerRatedNewArrival {
  static Rx<int> refresh = 0.obs;
  static changeLists() async {
    await GetNewArrivalBooks.getBooks();
    List<dynamic> data = GetNewArrivalBooks.booksBody;
    BookModel.newArrivalBookList = [];
    for (int i = 0; i < data.length; i++) {
      BookModel.newArrivalBookList.add(BookModel(
        imageUrl: data[i]['bookImageUrl'].toString(),
        rating: double.parse(data[i]['rate']),
        title: data[i]['name'],
        author: data[i]['author']['name'],
        price: double.parse(data[i]['price']),
        description: (data[i]['description']).toString(),
        language: data[i]['language'],
        pages: data[i]['pages'],
        id: (data[i]['id']),
        saved: saveChecker(data[i]['id']),
      ));
    }

    await GetTopRatedBooks.getBooks();
    List<dynamic> data1 = GetTopRatedBooks.booksBody;
    BookModel.topRatedBookList = [];

    for (int i = 0; i < data1.length; i++) {
      BookModel.topRatedBookList.add(BookModel(
        imageUrl: data1[i]['bookImageUrl'].toString(),
        rating: double.parse(data1[i]['rate']),
        title: data1[i]['name'],
        author: data1[i]['author']['name'],
        price: double.parse(data1[i]['price']),
        description: (data1[i]['description']).toString(),
        language: data1[i]['language'],
        pages: data1[i]['pages'],
        id: (data1[i]['id']),
        saved: saveChecker(data1[i]['id']),
      ));
    }

    await GetTopSellerBooks.getBooks();
    List<dynamic> data2 = GetTopSellerBooks.booksBody;
    BookModel.topSellerBookList = [];
    for (int i = 0; i < data2.length; i++) {
      BookModel.topSellerBookList.add(BookModel(
        imageUrl: data2[i]['bookImageUrl'].toString(),
        rating: double.parse(data2[i]['rate']),
        title: data2[i]['name'],
        author: data2[i]['author']['name'],
        price: double.parse(data2[i]['price']),
        description: (data2[i]['description']).toString(),
        language: data2[i]['language'],
        pages: data2[i]['pages'],
        id: (data2[i]['id']),
        saved: saveChecker(data2[i]['id']),
      ));
    }

  }
}
