import 'package:book_store/services/authors_genres_list_condition.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utilz/theme.dart';

class MySwapper extends StatelessWidget {
  const MySwapper({Key? key}) : super(key: key);
  static Rx<bool> authorCondition = true.obs;
  static Rx<bool> genresCondition = false.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 1),
        Container(
            width: 150,
            margin: const EdgeInsets.only(top: 26, bottom: 0),
            child: SizedBox(
              height: 80,
              child: Obx(() {
                return TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(
                          color: (genresCondition.value == true) ? Colors.white : AppTheme.mainColor,
                          width: 2,
                        ))),
                    backgroundColor: MaterialStateProperty.all((genresCondition.value == true) ? AppTheme.mainColor : Colors.grey[100]),
                  ),
                  child: Text("Genres", style: TextStyle(color: (genresCondition.value == true) ? Colors.white : Colors.grey[500], fontSize: 23)),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    genresCondition.value = true;
                    authorCondition.value = false;
                    ChangeShowedList.changeList();
                  },
                );
              }),
            )),
        const Spacer(flex: 2),
        Container(
            width: 150,
            height: 80,
            margin: const EdgeInsets.only(top: 26, bottom: 0),
            child: Obx(() {
              return TextButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  authorCondition.value = true;
                  genresCondition.value = false;
                  ChangeShowedList.changeList();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(
                        color: (authorCondition.value == true) ? Colors.white : AppTheme.mainColor,
                        width: 2,
                      ))),
                  backgroundColor: MaterialStateProperty.all((authorCondition.value == true) ? AppTheme.mainColor : Colors.grey[100]),
                ),
                child: Text("Authors", style: TextStyle(color: (authorCondition.value == true) ? Colors.white : Colors.grey[500], fontSize: 20)),
              );
            })),
        const Spacer(flex: 1),
      ],
    );
  }
}
