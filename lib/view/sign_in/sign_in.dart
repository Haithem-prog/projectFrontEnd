import 'package:book_store/Text_fields/number_text_fields.dart';
import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/navbar.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/services/top_seller_rated_new_arrival_books_condition.dart';
import 'package:book_store/view/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:book_store/Text_fields/Text_field.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController passwords = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var register Register ;
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Image.asset(
            'assets/images/book_store_logo1.png',
            width: 272.86,
            height: 204.65,
          ),
        ),
        Center(child: TextWidget(t: 'Sign in to continue', w: FontWeight.bold, c: Colors.black, z: 27)),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(t: 'Phone Number', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextFieldnum(controller: phoneNumber)),
              const SizedBox(height: 24),
              TextWidget(t: 'Password ', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextField(controller: passwords, isSecure: true)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextButton(
            onPressed: () async {
              await AuthService().signIn(phoneNumber: phoneNumber.text, password: passwords.text);
              ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: AuthService.signInMessage));
              await Future.delayed(Duration(seconds: 1));
              if (AuthService.statusCode == 200) {
                await GetSavedBooks.getAllSavedBooks();
                await GetTopSellerRatedNewArrival.changeLists();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Demonav()));
              }
            },
            child: const BorderedContainer(child: MyButtonText(text: 'Sign in')),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(t: 'Not yet registered? ', w: FontWeight.normal, c: Colors.black, z: 16.5),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: TextWidget(t: 'Register', w: FontWeight.w500, c: Color.fromARGB(255, 14, 132, 172), z: 18.5),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
