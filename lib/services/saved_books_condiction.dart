import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/get_saved_books.dart';

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
    }
  }
}



