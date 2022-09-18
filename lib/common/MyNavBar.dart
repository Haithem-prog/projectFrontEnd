import 'package:book_store/common/Texts.dart';
import 'package:book_store/utilz/theme.dart';
import 'package:book_store/view/cart/cart.dart';
import 'package:book_store/view/home/home.dart';
import 'package:book_store/view/profile/profile.dart';
import 'package:book_store/view/saved/saved.dart';
import 'package:book_store/view/search/search_default.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var selectedATab;
  Widget? currentAScreen;
  @override
  void initState() {
    super.initState();
    selectedATab = 2;
    currentAScreen = Home();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Stack(
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     height: 100,
          //     width: double.infinity,
          //     color: Colors.green,
          //   ),
          // ),
          PageStorage(
            child: currentAScreen!,
            bucket: bucket,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 80,
          width: 60,
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentAScreen = Search();
                        selectedATab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: 40,
                          color: selectedATab == 0 ? Colors.lightBlue : Colors.grey[600],
                        ),
                        Padding(padding: const EdgeInsets.only(top: 3.0), child: TextWidget(t: 'Search', w: FontWeight.w500, c: selectedATab == 0 ? Colors.lightBlue : Colors.grey[600], z: 13.5)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentAScreen = Saved();
                        selectedATab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark,
                          size: 40,
                          color: selectedATab == 1 ? Colors.lightBlue : Colors.grey[600],
                        ),
                        Padding(padding: const EdgeInsets.only(top: 3.0), child: TextWidget(t: 'Saved', w: FontWeight.w500, c: selectedATab == 1 ? Colors.lightBlue : Colors.grey[600], z: 13.5)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentAScreen = Home();
                        selectedATab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          size: 40,
                          color: selectedATab == 2 ? Colors.lightBlue : Colors.grey[600],
                        ),
                        Padding(padding: const EdgeInsets.only(top: 3.0), child: TextWidget(t: 'Home', w: FontWeight.w500, c: selectedATab == 2 ? Colors.lightBlue : Colors.grey[600], z: 13.5)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                    //minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentAScreen = Cart();
                        selectedATab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 40,
                          color: selectedATab == 3 ? Colors.lightBlue : Colors.grey[600],
                        ),
                        Padding(padding: const EdgeInsets.only(top: 3.0), child: TextWidget(t: 'Cart', w: FontWeight.w500, c: selectedATab == 3 ? Colors.lightBlue : Colors.grey[600], z: 13.5)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentAScreen = Profile();
                        selectedATab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_pin,
                          size: 40,
                          color: selectedATab == 4 ? Colors.lightBlue : Colors.grey[600],
                        ),
                        Padding(padding: const EdgeInsets.only(top: 3.0), child: TextWidget(t: 'Profile', w: FontWeight.w500, c: selectedATab == 4 ? Colors.lightBlue : Colors.grey[600], z: 13.5)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
