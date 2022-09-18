import 'package:book_store/models/authors_genres_model_listes.dart';
import 'package:book_store/services/authors_genres_list_condition.dart';
import 'package:book_store/view/search/components/search_in_desired_books.dart';
import 'package:book_store/services/search_books_condition.dart';
import 'package:book_store/view/search/components/search_box.dart';
import 'package:book_store/view/search/components/swapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListedAuthorsGenres extends StatelessWidget {
  const ListedAuthorsGenres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //print(size.width);
    String genreName = '';
    String authorName = '';
    int columns(double width) {
      if (width > 0 && width < 400) {
        return 2;
      } else if (width >= 400 && width <= 600) {
        return 3;
      } else if (width >= 600 && width <= 900) {
        return 4;
      } else {
        return 5;
      }
    }

    return Obx(() {
      Size size = MediaQuery.of(context).size;
      ChangeShowedList.refresh.value;
      SearchBox.searchWord = ''.obs;
      return Expanded(
        child: GridView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: columns(size.width), mainAxisExtent: 260),
          children: AuthorsGenresModel.authorsAndGenersList
              .map(
                (e) => Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2.5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],),
                  child: TextButton(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 120),
                            height: 30,
                            child: Text(e.name,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  height: 1.5,
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        // Expanded(
                        Container(
                            height: 193,
                            margin: const EdgeInsets.only(bottom: 10, left: 6, right: 6),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 4,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5),
                                )
                              ],
                              image: DecorationImage(image: NetworkImage(e.imageUrl), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(7),
                            )),
                        // ),
                      ],
                    ),
                    onPressed: () async {
                      SearchBox.searchWord = ''.obs;
                      if (MySwapper.genresCondition.value) {
                        authorName = '';
                        genreName = e.name;
                        await ChangeSearchList.changeList(searchByAll: false, generName: genreName, authorName: '');
                      } else if (MySwapper.authorCondition.value) {
                        genreName = '';
                        authorName = e.name;
                        await ChangeSearchList.changeList(searchByAll: false, authorName: authorName);
                      }
                      Get.to(() => SearchInDesiredBooks(authorName: authorName, generName: genreName));
                    },
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
