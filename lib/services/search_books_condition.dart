// this file will decide where to search (in all book, in books related to an author or in books related to an genre, by editing defaultBookList)
import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/services/backed_services/get_books_by_author.dart';
import 'package:book_store/services/backed_services/get_books_by_geners.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

import 'backed_services/get_all_books.dart';

class ChangeSearchList {

  static changeList({bool? searchByAll, String? authorName = null, String? generName = null}) async {
    if (searchByAll == true) {
      await GetAllBooks.getBooks();
      List<dynamic> data = GetAllBooks.booksBody;
      BookModel.defaultBookList = [];

      for (int i = 0; i < data.length; i++) {
        BookModel.defaultBookList.add(BookModel(
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
    } else if (authorName!.isNotEmpty) {
      await GetAllBooksByAuthor.getBooks(authorName);
      List<dynamic> data = GetAllBooksByAuthor.booksBody;
      BookModel.defaultBookList = [];

      for (int i = 0; i < data.length; i++) {
        BookModel.defaultBookList.add(BookModel(
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

    } else if (generName!.isNotEmpty) {
      await GetAllBooksByGener.getBooks(generName);
      List<dynamic> data = GetAllBooksByGener.booksBody;
      BookModel.defaultBookList = [];

      for (int i = 0; i < data.length; i++) {
        BookModel.defaultBookList.add(BookModel(
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
    }
  }
}


