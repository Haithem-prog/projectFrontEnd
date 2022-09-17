import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text TextWidget(
    {required String t,
    required FontWeight w,
    required Color? c,
    required double z}) {
  return Text(
    softWrap: false,
    maxLines: 1,
    t,
    style: GoogleFonts.notoSansMyanmar(
        fontSize: z-2,
        fontWeight: w,
        textStyle: TextStyle(
          overflow: TextOverflow.fade,
          height: 1,
          color: c,
        )),
  );
}
