
import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonText extends StatelessWidget {
  const MyButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.cairo(fontSize: 22, color: AppTheme.textwhite),);
  }
}