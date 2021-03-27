import 'package:first_app/CartWidget.dart';
import 'package:first_app/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.indexNumber});
  final int indexNumber;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: MyStatefulHomePage(
        indexNumber: this.indexNumber,
      ),
    );
  }
}

class MyStatefulHomePage extends StatefulWidget {
  // created a key to make it unique
  MyStatefulHomePage({Key key, this.indexNumber}) : super(key: key);

  final int indexNumber;

  _MyStatefulHomePage createState() => _MyStatefulHomePage();
}

class _MyStatefulHomePage extends State<MyStatefulHomePage> {
  int _selectedIndex = 0;
  String data = "We are at home page";
  bool cartView = false;
  // list the widgets according to the bottom nav options
  List<Widget> bottomNavBodyView = [
    Center(
        child: Column(children: <Widget>[
      Text("Home Page"),
    ])),
    // calling shopWidget for showing the data
    MyShopWidget(),
    Center(
        child: Column(children: <Widget>[
      Text("manage account"),
    ])),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    // this will call the build method
    setState(() {
      if (index == 0) {
        data = "home page";
      }
      if (index == 1) {
        data = "Shop Here";
      }
      if (index == 2) {
        data = "Manage Accounts";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.indexNumber;
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

  @override
  Widget build(BuildContext context) {
    if (cartView) {
      return MyCartWidget();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(data),
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

class ShopPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
