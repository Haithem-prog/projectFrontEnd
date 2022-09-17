import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/default_book_Model.dart';

class NewArrivalSliderItems extends StatelessWidget {
  final BookModel book;
  final Function(BookModel book) onPressed;
  const NewArrivalSliderItems({
    Key? key,
    required this.book,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(book),
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(0, 3),
              blurRadius: 2,
            )
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 3),
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 130),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    book.imageUrl,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 10),
                      child: Text(book.title.toString(), style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w400, textStyle: TextStyle(overflow: TextOverflow.ellipsis, height: 2))),
                    ),
                    Text(
                      book.author,
                      style: GoogleFonts.cairo(color: const Color.fromARGB(166, 0, 0, 0), fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    RatingStarsWidget(size: 20, rate: book.rating),
                    const SizedBox(height: 8),
                    Text(
                      '${book.price.toString()}\$',
                      style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Tap to see more >>',
                      style: GoogleFonts.cairo(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
