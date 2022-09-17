import 'package:flutter/material.dart';

class BookModel {
  BookModel({
    Key? key,
    required this.id,
    required this.pages,
    required this.language,
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
    required this.saved, 
  });
  final String imageUrl;
  final double rating;
  final String title;
  final String author;
  final double price;
  final String description;
  final int pages;
  final String language;
  final int id;
  final bool saved;

  static List<BookModel> defaultBookList = [];
  static List<BookModel> newArrivalBookList = [];
  static List<BookModel> topRatedBookList = [];
  static List<BookModel> topSellerBookList = [];

  static List<BookModel> savedBookList = [];
  static List<BookModel> purchasedBookList = [];
}

class CartModel extends BookModel {
  CartModel({required super.id, required super.pages, required super.language, required super.imageUrl, required super.rating, required super.title, required super.author, required super.price, required super.description, required this.qty ,required super.saved});
  final int qty;
  static List<CartModel> cartBookList = [];

}
