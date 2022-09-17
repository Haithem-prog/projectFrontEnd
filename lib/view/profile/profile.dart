import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/ratin_star.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/services/profile_condition.dart';
import 'package:book_store/services/purchased_books_condition.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/home/shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetPurchasedBooks.getAllPurchasedBooks();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: Customshape(),
                child: Container(height: 330, color: const Color(0xff073b4c)),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    color: Colors.white,
                    height: 100,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 175),
                  child: TextWidget(t: GetProfile.userName() ?? 'noBody', w: FontWeight.bold, c: Colors.white, z: 22),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: size.width - 180),
            child: TextWidget(t: 'Your Purchases', w: FontWeight.bold, c: Colors.black, z: 22),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: BookModel.purchasedBookList
                  .map((e) => TextButton(
                        onPressed: () => Get.to(
                          () => BookDetailsScreen(book: e),
                        ),
                        child: Container(
                          width: 145,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  margin: EdgeInsets.only(bottom: 10),
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
                              ),
                              SizedBox(height: 2),
                              SizedBox(
                                height: 25,
                                child: TextWidget(t: e.title, c: Colors.grey.shade800, z: 18, w: FontWeight.bold),
                              ),
                              TextWidget(t: e.author, c: Colors.grey[600], z: 14, w: FontWeight.normal),
                              SizedBox(height: 4),
                              SizedBox(
                                width: 109,
                                child: RatingStarsWidget(rate: e.rating, size: 19),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 35),
            width: 115,
            height: 36,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                    side: BorderSide(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.amber,
                ),
              ),
              child: TextWidget(t: 'Sign out', w: FontWeight.w600, c: Colors.white, z: 16),
            ),
          ),
        ],
      ),
    );
  }
}
