import 'package:book_store/common/save_checker.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/get_saved_books.dart';
import 'package:get/get.dart';

class GetSavedBooks {
  static late List? savedBooksIds;
  static getAllSavedBooks() async {
    await GetSaved.getSavedBooks();
    List<dynamic> data = GetSaved.booksBody;
    BookModel.savedBookList = [];
    savedBooksIds = [];
    if (GetSaved.noSavedBook != true) {
      for (int i = 0; i < data.length; i++) {
        BookModel.savedBookList.add(BookModel(
          imageUrl: data[i]['book']['bookImageUrl'].toString(),
          rating: double.parse(data[i]['book']['rate']),
          title: data[i]['book']['name'],
          author: data[i]['book']['author']['name'],
          price: double.parse(data[i]['book']['price']),
          description: (data[i]['book']['description']).toString(),
          language: data[i]['book']['language'],
          pages: data[i]['book']['pages'],
          id: (data[i]['book']['id']),
          saved: true,
        ));
        savedBooksIds!.add(data[i]['book']['id']);
      }
      print(savedBooksIds);
    }
  }
}



    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp2hmVoM_vMrFcJOTuQrhq0GQgrDCMlhLv3ei54PHq&s',
    //     rating: 4,
    //     title: '   ddddddd   dddسييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييييي ييييييييddddddddddddddddddddddddddd',
    //     author: 'NEW',
    //     description: 'idkjndlkdjfnv;kjn',
    //     price: 5,
    //     id: 0,
    //     language: '',
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80',
    //     rating: 5,
    //     title: ' ddddd ddddd ddddddddd dddddddddddd',
    //     author: 'NEW',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    //   BookModel(
    //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-JUjJifI_U5X-Fp_G1fEdrYozUuK4j0FgkBbIfKE&s',
    //     rating: 5,
    //     title: 'how is FAIR I HAVE NO',
    //     author: 'NEW',
    //     description: '2',
    //     price: 5,
    //     language: 'English',
    //     id: 0,
    //     pages: 2,
    //   ),
    // ];