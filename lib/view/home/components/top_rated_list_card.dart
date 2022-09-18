import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container topRatedtextButtons(BookModel e, BuildContext context) {
  return Container(
    width: 150,
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
    child: TextButton(
      onPressed: () async {
        await GetSavedBooks.getAllSavedBooks();
        BookDetailsScreen.saved =  GetSavedBooks.savedBooksIds!.contains(e.id);
        Get.to(() => BookDetailsScreen(book: e));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(e.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8),
            width: 110,
            child: Center(
              child: TextWidget(t: e.title, c: Colors.black, z: 16, w: FontWeight.w400),
            ),
          ),
          TextWidget(t: e.author, c: Colors.grey, z: 13, w: FontWeight.w200),
          const SizedBox(height: 3),
          RatingStarsWidget(rate: e.rating, size: 12)
        ],
      ),
    ),
  );
}
