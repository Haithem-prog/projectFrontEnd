import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/top_seller_rated_new_arrival_books_condition.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:book_store/view/home/components/top_rated_list_card.dart';
import 'package:book_store/view/home/components/top_seller_list_card.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:book_store/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../models/default_book_Model.dart';
import 'components/new_arrival_carouse_items.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static Rx<bool> refresh = false.obs;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GetPersonalCartBooksAndTotals.getCart();
    GetTopSellerRatedNewArrival.changeLists();
    return Obx(() {
      Home.refresh.value;
      Home.refresh = false.obs;
      Home.refresh.value;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                ClipPath(
                  clipper: Customshape(),
                  child: Container(height: 300, color: const Color(0xff073b4c)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'New Arrival',
                            style: GoogleFonts.cairo(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => Profile()),
                            child: SvgPicture.asset(
                              'assets/images/profile.svg',
                              color: Colors.white,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    //NEW ARRIVAL-----------------
                    SizedBox(
                      height: 200,
                      child: CarouselSlider(
                        items: BookModel.newArrivalBookList
                            .map(
                              (e) => NewArrivalSliderItems(
                                book: e,
                                onPressed: (book) async {
                                  await GetSavedBooks.getAllSavedBooks();
                                  BookDetailsScreen.saved = GetSavedBooks.savedBooksIds!.contains(e.id);
                                  Get.to(() => BookDetailsScreen(book: book));
                                },
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(aspectRatio: 2.0, enlargeCenterPage: true, enableInfiniteScroll: true, initialPage: 3, autoPlay: true, autoPlayCurve: Curves.fastOutSlowIn, height: 400),
                      ),
                    ),
                    // TOP RATED------------------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '  Top Rated',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: BookModel.topRatedBookList.map((e) => topRatedtextButtons(e, context)).toList(),
                          ),
                        )
                      ],
                    ),
                    // TOP SELLER------------------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '  Top Seller',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height - 65,
                          child: ListView(
                            padding: const EdgeInsets.all(1),
                            scrollDirection: Axis.vertical,
                            children: BookModel.topRatedBookList.map((e) => topSellertextButonss(e, context)).toList(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
