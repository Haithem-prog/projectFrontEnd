import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/top_seller_rated_new_arrival_books_condition.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:book_store/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../models/default_book_Model.dart';
import '../../common/top_rated_horizontal_list.dart';
import '../../common/new_arrival_carouse_items.dart';
import '../../common/top_seller_vertical_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    GetPersonalCart.getCartItems();
    GetSavedBooks.getAllSavedBooks();
    GetPersonalCartBooksAndTotals.getCart();
    GetTopSellerRatedNewArrival.changeLists();
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
                          onTap: () => Get.to(() =>  Profile()),
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
                              onPressed: (book) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Text(
                          'Top Rated',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: BookModel.topRatedBookList.length,
                            itemBuilder: (context, int index) {
                              return HorizontalList(
                                imageUrl: BookModel.topRatedBookList[index].imageUrl,
                                auther: BookModel.topRatedBookList[index].author,
                                rate: BookModel.topRatedBookList[index].rating,
                                name: BookModel.topRatedBookList[index].title,
                                rateSize: 15,
                                onPressed: (book) {
                                  Get.to(() => BookDetailsScreen(book: book));
                                },
                                item: BookModel.topRatedBookList[index],
                              );
                            }),
                      ),
                    ],
                  ),
                  // TOP SELLER------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Top Seller',
                          style: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: List.generate(
                            BookModel.topSellerBookList.length,
                            (index) => TopSellerVerticalList(
                              imageUrl: BookModel.topSellerBookList[index].imageUrl,
                              auther: BookModel.topSellerBookList[index].author,
                              rate: BookModel.topSellerBookList[index].rating,
                              name: BookModel.topSellerBookList[index].title,
                              rateSize: 15,
                              price: BookModel.topSellerBookList[index].price,
                              item: BookModel.topSellerBookList[index],
                              onPressed: (book) {
                                Get.to(() => BookDetailsScreen(book: book));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
