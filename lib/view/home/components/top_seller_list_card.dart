import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/save_unsave.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/top_seller_rated_new_arrival_books_condition.dart';
import 'package:book_store/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container topSellertextButonss(BookModel e, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: 170,
    margin: const EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          offset: Offset(0, 1),
          blurRadius: 2,
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: () async { 
        await GetSavedBooks.getAllSavedBooks();
        BookDetailsScreen.saved =  GetSavedBooks.savedBooksIds!.contains(e.id);
        Get.to(() => BookDetailsScreen(book: e));},
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            SizedBox(
              width: 115,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(e.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 14, left: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 3),
                      child: TextWidget(t: e.title, c: Colors.black, z: 22, w: FontWeight.w400),
                    ),
                    const SizedBox(height: 11),
                    TextWidget(t: e.author, c: Colors.grey, z: 17, w: FontWeight.w200),
                    const SizedBox(height: 11),
                    SizedBox(
                      width: 95.5,
                      child: RatingStarsWidget(rate: e.rating, size: 17.5),
                    ),
                    const SizedBox(height: 11),
                    TextWidget(t: '${e.price.toString()}\$', c: Colors.black, z: 17, w: FontWeight.w400),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 165,
              width: 50,
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
                    await GetTopSellerRatedNewArrival.changeLists();
                    ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: SaveUnsave.message));
                    Home.refresh.value = true;
                  },
                  icon: e.saved ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline)),
            )
          ],
        ),
      ),
    ),
  );
}
