import 'package:flutter/material.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({Key? key, required this.rate, required this.size}) : super(key: key);
  final double rate ;
  final double size;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: RatingStars(
          editable: true,
          rating: rate,
          color: Colors.amber,
          iconSize: size,
        ),
    );
    
  }
}