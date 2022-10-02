import 'package:book_store/common/Texts.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';

SnackBar mySnackBar({required String message}) {
  return SnackBar(
      elevation: 0,
      dismissDirection: DismissDirection.horizontal,
      content: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Center(child: TextWidget(t: message, w: FontWeight.w500, c: Colors.black, z: 18)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 2000),
      backgroundColor: Colors.transparent);
}
