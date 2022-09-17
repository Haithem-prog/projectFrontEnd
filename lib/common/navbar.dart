import 'package:book_store/services/personal_cart_condition.dart';
import 'package:book_store/view/cart/cart.dart';
import 'package:book_store/view/home/home.dart';
import 'package:book_store/view/saved/saved.dart';
import 'package:book_store/view/search/search_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Demonav extends StatelessWidget {
  const Demonav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.grey[200],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[Home(), Search(), Saved(), Cart()],
        ),
        bottomNavigationBar: WaterDropNavBar(
          waterDropColor: Color(0xff073b4c),
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(filledIcon: Icons.search_sharp, outlinedIcon: Icons.search_outlined),
            BarItem(
              filledIcon: Icons.bookmark,
              outlinedIcon: Icons.bookmark_outline_outlined,
            ),
            BarItem(
              filledIcon: Icons.shopping_cart,
              outlinedIcon: Icons.shopping_cart_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
