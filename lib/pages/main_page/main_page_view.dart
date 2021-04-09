// view of main page

import 'package:first_app/Pages/account_page/account_page_view.dart';
import 'package:first_app/Pages/shop_page/ShopPage.dart';
import 'package:first_app/Pages/shop_page/widget/CartWidget.dart';
import 'package:first_app/pages/home_page/HomePage.dart';
import 'package:flutter/material.dart';

/*
This widget containt the main page ( first page after opening the app) view.

Currently it has a bottom navigation bar which contains

Home_Page
Shop_Page
Account_Page

*/

class MyStatefulMainPageView extends StatefulWidget {
  final int indexNumber;

  // created a key to make it unique
  MyStatefulMainPageView({Key? key, required this.indexNumber})
      : super(key: key);

  _MyStatefulMainPageView createState() => _MyStatefulMainPageView();
}

class _MyStatefulMainPageView extends State<MyStatefulMainPageView> {
  int _selectedIndex = 0;

  List<String> data = [];

  bool cartView = false;
  List<Widget> bottomNavBodyView = [];

  _MyStatefulMainPageView() {
    _selectedIndex = 0;

    /* This data should be obtain from the API  */
    data.add("Home Page");
    data.add("Shop Here");
    data.add("Account & Settings");

    cartView = false;
    bottomNavBodyView = [];

    //------------------------- has to change the view
    bottomNavBodyView.add(HomePageView());

    bottomNavBodyView.add(
        // calling shopWidget for showing the data
        MyShopWidget());

    bottomNavBodyView.add(AccountPageView());
  }

/* ---------------------Start: Custom Methods/Callbacks ----------------------- */
  /*
  When the bottom navigation has been clicked 
  */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(data[_selectedIndex]);
    });
  }

  /*
  If the Icon at app bar is clicked then change the view 
   */
  void _onAppBarCartIconTapped() {
    // goto the Cart page
    print("In _onAppBarCartIconTapped Cart!");

    // Don't use the persistent value

    // this will cause the widget to render again
    setState(() {
      cartView = true;
    });
  }
/* ---------------------End: Custom Methods/Callbacks ----------------------- */

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.indexNumber;
  }

  @override
  Widget build(BuildContext context) {
    if (cartView) {
      return MyCartWidget();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(data[_selectedIndex]),
        actions: <Widget>[
          // add the animations here
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: "Cart : See your added items here !",
            onPressed: _onAppBarCartIconTapped,
          ),

          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: "Notifications",
            onPressed: () {
              // go to the notification widget
              print("In onPressed !");
            },
          ),
        ],
        centerTitle: true,
      ),
      body: bottomNavBodyView[_selectedIndex],

      //--------------------Bottom Navigation Bar-----------------------------------------

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //-------------------------------------------------------------
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          //-------------------------------------------------------------
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"),
          //-------------------------------------------------------------
        ],
        // on clicking the bottom navigation bar
        currentIndex: _selectedIndex,
        //selectedIconTheme: IconThemeData.fallback(),
        selectedItemColor: Colors.amber[800], //Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}
