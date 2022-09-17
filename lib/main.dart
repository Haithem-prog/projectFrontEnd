import 'package:book_store/common/navbar.dart';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/services/saved_books_condiction.dart';
import 'package:book_store/view/home/home.dart';
import 'package:book_store/view/search/search_default.dart';
import 'package:book_store/view/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signin(),
    );
  }
}
