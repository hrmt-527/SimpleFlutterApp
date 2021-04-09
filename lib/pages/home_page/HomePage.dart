import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);
  _HomePageView createState() => _HomePageView();
}

class _HomePageView extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            NotificationView(),
          ],
        ),
      ),
    );
  }
}

/*
Space for notification in the app 
*/

class NotificationView extends StatefulWidget {
  NotificationView({Key? key}) : super(key: key);
  _NotificationView createState() => _NotificationView();
}

class _NotificationView extends State<NotificationView> {
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(2.0),
      constraints: BoxConstraints(
          maxHeight: .3 * height,
          maxWidth: (width - 2.0),
          minHeight: .3 * height,
          minWidth: (width - 2.0)),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(2.7))),
      child: Text("Notification Will come here"),
    );
  }
}
