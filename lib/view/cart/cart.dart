import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/models/default_book_Model.dart';
import 'package:book_store/services/backed_services/personal_cart.dart';
import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/services/purchased_books_condition.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/common/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    GetPersonalCartBooksAndTotals.getCart();
    Size size = MediaQuery.of(context).size; //subrashi
    double totalPrice = double.parse(GetPersonalCartBooksAndTotals.totalPrice);
    int totalQty = GetPersonalCartBooksAndTotals.totalQty;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 50),
                child: ListView(
                  padding: EdgeInsets.all(1),
                  children: CartModel.cartBookList
                      .map((e) => TextButton(
                            onPressed: () {
                              BookDetailsScreen.saved = GetSavedBooks.savedBooksIds!.contains(e.id);
                              Get.to(() => BookDetailsScreen(book: e));
                            },
                            child: Container(
                              width: size.width,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2, spreadRadius: 1.5, offset: Offset(0, 1))],
                              ),
                              child: Row(children: [
                                Container(
                                  width: 105,
                                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 7),
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
                                      children: [
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          height: 30,
                                          child: TextWidget(
                                            t: e.title,
                                            c: Colors.grey.shade800,
                                            z: 20,
                                            w: FontWeight.bold,
                                          ),
                                        ),
                                        TextWidget(
                                          t: e.author,
                                          c: Colors.grey[600],
                                          z: 17,
                                          w: FontWeight.normal,
                                        ),
                                        const SizedBox(height: 7),
                                        TextWidget(
                                          t: e.price.toString() + '\$',
                                          c: Colors.black,
                                          z: 16,
                                          w: FontWeight.w500,
                                        ),
                                        const SizedBox(height: 10),
                                        TextWidget(
                                          t: e.qty.toString() + ' Pcs',
                                          c: Colors.black,
                                          z: 15,
                                          w: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    iconSize: 30,
                                    color: const Color(0xffE9C46A),
                                    onPressed: () async {
                                      await GetPersonalCart.addItemToCart(e.id, e.qty, true);
                                      await GetPersonalCartBooksAndTotals.getCart();
                                      await ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: GetPersonalCart.message));
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.remove_circle_outline))
                              ]),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              height: 210,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 45),
                  Container(
                    color: AppTheme.mainColor,
                    height: 40,
                    width: size.width,
                    child: Center(
                      child: TextWidget(
                        t: 'Total Price: ' + totalPrice.toString() + '\$',
                        w: FontWeight.bold,
                        c: Colors.white,
                        z: 23,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: AppTheme.mainColor,
                    height: 40,
                    width: size.width,
                    child: Center(
                      child: TextWidget(
                        t: 'Total Pieces: ' + totalQty.toString(),
                        w: FontWeight.bold,
                        c: Colors.white,
                        z: 23,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 13),
                    width: 150,
                    height: 45,
                    child: TextButton(
                      onPressed: () async {
                        await GetPersonalCart.buyItemsInCart();
                        await GetPersonalCartBooksAndTotals.getCart();
                        await GetPurchasedBooks.getAllPurchasedBooks();
                        ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: GetPersonalCart.message));
                        setState(() {});
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: const BorderSide(color: AppTheme.mainColor, width: 2),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          AppTheme.mainColor,
                        ),
                      ),
                      child: TextWidget(t: 'Buy', w: FontWeight.w600, c: Colors.white, z: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
