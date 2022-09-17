import 'package:book_store/common/search_in_desired_books.dart';
import 'package:book_store/services/search_books_condition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.text, this.allBooksCondiction}) : super(key: key);
  static RxString searchWord = ''.obs;
  final String text;
  final bool? allBooksCondiction;
  static TextEditingController myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: myController1,
        onSubmitted: (value) => Get.to(() => const SearchInDesiredBooks(searchInAll: true, generName: '', authorName: '')),
        onTap: () {
          SearchBox.searchWord.value = myController1.text;
        },
        onChanged: (c) {
          searchWord.value = c;
        },
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            suffixIcon: TextButton(
                style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                child: Obx(() {
                  return Icon(Icons.search, color: searchWord.value.isEmpty ? Colors.grey : Colors.blue, size: 30);
                }),
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  SearchBox.searchWord.value = myController1.text;
                  if (allBooksCondiction == true) {
                    SearchBox.searchWord = ''.obs;
                    ChangeSearchList.changeList(searchByAll: true);
                    await ChangeSearchList.changeList(searchByAll: true);
                    Get.to(() => const SearchInDesiredBooks(searchInAll: true, generName: '', authorName: ''));
                  }
                }),
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.blue), borderRadius: BorderRadius.circular(15))),
        autofocus: false,
      ),
    );
  }
}
