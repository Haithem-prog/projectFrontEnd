import 'package:book_store/common/Texts.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';

SnackBar mySnackBar({required String message}) {
  return SnackBar(
      elevation: 0,
      content: Container(
        padding: EdgeInsets.all(15),
        height: 70,
        decoration: BoxDecoration(color: AppTheme.mainColor, borderRadius: BorderRadius.circular(20)),
        child: TextWidget(t: message, w: FontWeight.normal, c: Colors.white, z: 17),
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 900),
      backgroundColor: Colors.transparent);
}
