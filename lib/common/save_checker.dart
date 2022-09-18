import 'package:book_store/services/saved_books_condiction.dart';

bool saveChecker(int id) {
  late List data;
  data = GetSavedBooks.savedBooksIds??[0];
  if (data.contains(id)) {
    return true;
  } else {
    return false;
  }
}
