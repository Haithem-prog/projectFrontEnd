import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/backed_services/save_unsave.dart';
import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/top_seller_rated_new_arrival_books_condition.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);
  static Rx<bool> refreshSaved = false.obs;

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //subrashi
    return Obx(() {
      Saved.refreshSaved.value;
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            children: BookModel.savedBookList
                .map((e) => TextButton(
                      onPressed: () async {
                        BookDetailsScreen.saved = GetSavedBooks.savedBooksIds!.contains(e.id);
                        Get.to(() => BookDetailsScreen(book: e));
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
                                padding: EdgeInsets.only(top: 14, left: 15, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: TextWidget(t: e.title, c: Colors.grey.shade800, z: 22, w: FontWeight.bold),
                                    ),
                                    TextWidget(t: e.author, c: Colors.grey, z: 19, w: FontWeight.normal),
                                    TextWidget(t: e.price.toString() + '\$', c: Colors.black, z: 15, w: FontWeight.w400),
                                    SizedBox(
                                      width: 109,
                                      child: RatingStarsWidget(rate: e.rating, size: 19),
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 6),
                                            width: 100,
                                            height: 30,
                                            child: TextButton(
                                              onPressed: () async {
                                                await GetPersonalCart.addItemToCart(e.id, 1, false);
                                                ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: GetPersonalCart.message));
                                                await GetPersonalCartBooksAndTotals.getCart();
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
                                                backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
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
                                                ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: SaveUnsave.message));
                                                await GetSavedBooks.getAllSavedBooks();
                                                await GetTopSellerRatedNewArrival.changeLists();
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
          ),
        ),
      );
    });
  }
}
