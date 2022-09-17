import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/default_book_Model.dart';

class TopSellerVerticalList extends StatefulWidget {
  TopSellerVerticalList({Key? key, required this.imageUrl, required this.name, required this.auther, required this.rate, required this.rateSize, required this.price, required this.item, this.onPressed}) : super(key: key);
  final String imageUrl;
  final String name;
  final String auther;
  final double rate;
  final double price;
  final double rateSize;
  final BookModel item;
  Function(BookModel book)? onPressed;
  @override
  State<TopSellerVerticalList> createState() => _TopSellerVerticalListState();
}

class _TopSellerVerticalListState extends State<TopSellerVerticalList> {
  bool savestat = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed!(widget.item),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
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
        child: Row(
          children: [
            SizedBox(
              height: 135,
              width: 95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  margin: EdgeInsets.only(right: 10),
                  child: Text(widget.name.toString(), style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w400, textStyle: TextStyle(overflow: TextOverflow.ellipsis, height: 2))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.auther,
                  style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingStarsWidget(rate: widget.rate, size: widget.rateSize),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.price.toString()}\$',
                  style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                iconSize: 30,
                color: const Color(0xffE9C46A),
                onPressed: () {
                  setState(() {
                    savestat = !savestat;
                  });
                },
                icon: savestat ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline))
          ],
        ),
      ),
    );
  }
}
