import 'package:flutter/material.dart';

/*----------- Custom --------------------- */
import 'package:first_app/pages/main_page/main_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // these both are controlling which theme will be there
      // if theme or darkTheme has been provided
      //theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //themeMode: obj.currentTheme(),

      home: MainPage(
        indexNumber: 0,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final int indexNumber;

  MainPage({required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    // Can the materialApp <> Scaffold
    return MaterialApp(
      title: "Home Page",
      home: MyStatefulMainPageView(
        indexNumber: this.indexNumber,
      ),
    );
  }
}
