import 'package:first_app/pages/home_page/HomePage.dart';
import 'package:flutter/material.dart';

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
                      MaterialPageRoute(builder: (context) => HomePageView()));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
