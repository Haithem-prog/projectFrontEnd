import 'package:book_store/services/authors_genres_list_condition.dart';
import 'package:flutter/material.dart';

class AuthorsGenresModel {
  AuthorsGenresModel({
    Key? key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;
  static initialList() {
    ChangeShowedList.changeList();
  }

  static List<AuthorsGenresModel> authorsAndGenersList = [];
}
