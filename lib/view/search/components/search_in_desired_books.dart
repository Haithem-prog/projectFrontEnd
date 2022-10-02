import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/services/backed_services/get_saved_books.dart';
import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/backed_services/save_unsave.dart';
import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/search_books_condition.dart';
import 'package:book_store/view/search/components/search_box.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInDesiredBooks extends StatefulWidget {
  const SearchInDesiredBooks({Key? key, this.authorName, this.generName, this.searchInAll}) : super(key: key);
  final String? authorName;
  final String? generName;
  final bool? searchInAll;
  static late List savedBookids;
  static Rx<bool> refreshBopks = false.obs;

  @override
  State<SearchInDesiredBooks> createState() => _SearchInDesiredBooksState();
}

class _SearchInDesiredBooksState extends State<SearchInDesiredBooks> {
  bool filterSearchFunction(BookModel element, String searchWord) {
    if (element.title.toLowerCase().contains(searchWord.toLowerCase())) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //subrashi
    ChangeSearchList.changeList(authorName: widget.authorName, generName: widget.generName, searchByAll: widget.searchInAll);
    return Obx(() {
      SearchInDesiredBooks.refreshBopks.value;
      SearchInDesiredBooks.refreshBopks = false.obs;
      SearchInDesiredBooks.refreshBopks.value;
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: [
            const SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SearchBox(text: widget.authorName!.isEmpty ? 'Search in ${widget.generName} books...' : 'Search books written by ${widget.authorName}...'),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Obx(() {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  children: BookModel.defaultBookList
                      .where((element) => filterSearchFunction(element, SearchBox.searchWord.value))
                      .map((e) => TextButton(
                            onPressed: () async {
                              await GetSavedBooks.getAllSavedBooks();
                              BookDetailsScreen.saved = GetSavedBooks.savedBooksIds!.contains(e.id);
                              Get.to(() => BookDetailsScreen(book: e, authorName: widget.authorName, genreName: widget.generName, searchByAll: widget.searchInAll,toggleSearch: true));
                            },
                            child: Container(
                              width: size.width,
                              height: 165,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      image: DecorationImage(
                                        image: NetworkImage(e.imageUrl),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 14, left: 15, bottom: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 23,
                                            child: TextWidget(t: e.title, c: Colors.grey.shade800, z: 20, w: FontWeight.bold),
                                          ),
                                          TextWidget(t: e.author, c: Colors.grey, z: 17, w: FontWeight.normal),
                                          TextWidget(t: e.price.toString() + '\$', c: Colors.black, z: 14, w: FontWeight.w400),
                                          SizedBox(
                                            width: 109,
                                            child: RatingStarsWidget(
                                              rate: e.rating,
                                              size: 19,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 10),
                                            height: 35,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(top: 6, left: 4.5),
                                                  width: 100,
                                                  height: 30,
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      await GetPersonalCart.addItemToCart(e.id, 1, false);
                                                      await GetPersonalCartBooksAndTotals.getCart();
                                                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: GetPersonalCart.message));
                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(9),
                                                          side: const BorderSide(
                                                            color: AppTheme.mainColor,
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor: MaterialStateProperty.all(
                                                        AppTheme.mainColor,
                                                      ),
                                                    ),
                                                    child: TextWidget(t: 'Add to cart', w: FontWeight.w600, c: Colors.white, z: 13),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(bottom: 6),
                                                  child: IconButton(
                                                    iconSize: 30,
                                                    color: const Color(0xffE9C46A),
                                                    onPressed: () async {
                                                      if (e.saved == true) {
                                                        await SaveUnsave.saveUnsaveBook(e.id, false);
                                                      } else if (e.saved == false) {
                                                        await SaveUnsave.saveUnsaveBook(e.id, true);
                                                      }
                                                      await GetSavedBooks.getAllSavedBooks();
                                                      await ChangeSearchList.changeList(authorName: widget.authorName, generName: widget.generName, searchByAll: widget.searchInAll);
                                                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: SaveUnsave.message));
                                                      setState(() {});
                                                    },
                                                    icon: e.saved ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              }),
            )
          ]),
        ),
      );
    });
  }
}
