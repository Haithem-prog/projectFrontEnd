import 'package:flutter/material.dart';
import 'package:book_store/utilz/theme.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({Key? key, required this.child, this.thickness = 3})
      : super(key: key);
  final Widget child;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      width: 175,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.mainColor),
      ),
      child: child,
    );
  }
}
