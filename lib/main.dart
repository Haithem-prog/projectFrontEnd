import 'package:book_store/view/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//befoe
/* Future<void> main() async {
  runApp(const MyApp());
} */
//after
void main() {
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
