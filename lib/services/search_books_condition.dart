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
  static Rx<int> refresh = 0.obs;

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
      refresh.value = 1;
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

      refresh.value = 0;
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
      refresh.value = 2;
    }
  }
}


      // print(data[0]['bookImageUrl']);
      // print(data[0]['rate'].runtimeType);
      // print(data[0]['name'].runtimeType);
      // print(data[0]['author']['name'].runtimeType);
      // print(data[0]['price'].runtimeType);
      // print(data[0]['description'].runtimeType);
      // print(data[0]['language'].runtimeType);
      // print(data[0]['pages'].runtimeType);
      // print(data[0]['id'].runtimeType);
      // print(data.length);

  // BookModel.defaultBookList = [
      //   BookModel(
      //       imageUrl: 'https://images.unsplash.com/photo-1600885832003-1b612b431f7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3R8ZW58MHx8MHx8&w=1000&q=80',
      //       rating: 4,
      //       title: 'author-',
      //       author: '$authorName', // will be changed
      //       description: 'idkjndlkdjfnv;kjn',
      //       price: 5,
      //       id: 0,
      //       language: '',
      //       pages: 2),
      //   BookModel(
      //     imageUrl: 'https://images.unsplash.com/photo-1600885832003-1b612b431f7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3R8ZW58MHx8MHx8&w=1000&q=80',
      //     rating: 5,
      //     title: 'author-',
      //     author: '$authorName',
      //     description: '2',
      //     price: 5,
      //     language: 'English',
      //     id: 0,
      //     pages: 2,
      //   ),
      // ];





            // BookModel.defaultBookList = [
      //   BookModel(
      //     imageUrl: 'https://i.pinimg.com/564x/60/53/71/60537197052b1e259dda1c379a91b545.jpg',
      //     rating: 4,
      //     title: 'genre-',
      //     author: 'genre',
      //     description: 'idkjndlkdjfnv;kjn',
      //     price: 5,
      //     id: 0,
      //     language: '',
      //     pages: 2,
      //   ),
      //   BookModel(
      //     imageUrl: 'https://i.pinimg.com/564x/60/53/71/60537197052b1e259dda1c379a91b545.jpg',
      //     rating: 5,
      //     title: 'genre-',
      //     author: 'genre',
      //     description: '2',
      //     price: 5,
      //     language: 'English',
      //     id: 0,
      //     pages: 2,
      //   ),
      // ];