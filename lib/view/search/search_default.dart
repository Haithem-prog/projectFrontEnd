import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/search_books_condition.dart';
import 'package:book_store/view/search/components/search_box.dart';
import 'package:book_store/models/authors_genres_model_listes.dart';
import 'package:book_store/view/search/components/listed_authors_Genres.dart';
import 'package:book_store/view/search/components/swapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorsGenresModel.initialList();
    //GetPersonalCart.getCartItems();
    //ChangeSearchList.changeList( searchByAll: true);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 100,
                child: Container(
                  color: Colors.white,
                  child: Column(children: const [
                    SizedBox(height: 65),
                    SearchBox(text: "Search in all available books", allBooksCondiction: true),
                    SizedBox(height: 80, child: MySwapper()),
                    ListedAuthorsGenres(),
                  ]),
                ),
              ),
              const Spacer(flex: 4),
            ],
          )),
    );
  }
}
