library config.globals;

import 'package:flutter/material.dart';

/*------------------- Custom ------------------*/

import 'package:first_app/widgets/RegistrationWidget.dart';
import 'package:first_app/text_as_link.dart';

class ThemeChange with ChangeNotifier {
  static bool isDark = false;

  ThemeMode currentTheme() {
    return (isDark ? ThemeMode.dark : ThemeMode.light);
  }

  bool changeTheme() {
    isDark = !isDark;
    notifyListeners();
    return isDark;
  }
}

// theme change should be related to overall setting
// i.e. settings/account view
ThemeChange obj = ThemeChange();

// class MyAppState extends State<MyApp> {
//   @override
//   void didUpdateWidget(MyApp oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     obj.addListener(() {
//       print("theme changed");
//       setState(() {
//         print("\n" + obj.currentTheme().toString());
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     print("\n Init state");
//     obj.addListener(() {
//       print("theme changed");
//       setState(() {
//         print("\n" + obj.currentTheme().toString());
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // these both are controlling which theme will be there
//       // if theme or darkTheme has been provided
//       //theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: obj.currentTheme(),

//       home: MyHomePage(title: 'First App'),
//     );
//   }
// }

//---------------------- Main Widgets Child this class is immutable--------------------

class AuthPage extends StatefulWidget {
  AuthPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyAuthPageState createState() => _MyAuthPageState();
}

//------------------------------------------
class _MyAuthPageState extends State<AuthPage> {
  Color floatButtonColor = Colors.black;
  Color iconColor = Colors.white;
  double height = 0;
  double width = 0;

  // trying to set the state to
  void themeMode() {
    setState(() {
      bool res = obj.changeTheme();
      floatButtonColor = (res ? Colors.black : Colors.white);
      iconColor = (res ? Colors.white : Colors.black);
    });
  }

  void initState() {
    super.initState();
    floatButtonColor = Colors.black;
    iconColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    // screen width and height
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DraggableScrollableSheet(
            initialChildSize: .85,
            minChildSize: .5,
            maxChildSize: .9,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: .15 * height,
                        child: Text(
                          "REGISTRATION",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Container(
                        height: .35 * height,
                        child: MyRegistrationWidget(),
                      ),
                      Container(
                        height: .1 * height,
                        child: MyTextAsLinkWidget(),
                      ),
                      Container(
                        height: .1 * height,
                        // here top mean sibling or upper
                        margin: EdgeInsets.only(
                          left: .75 * width,
                        ),
                        child: FloatingActionButton(
                          tooltip: "change theme",
                          onPressed: themeMode,
                          backgroundColor: floatButtonColor,
                          child: Icon(
                            Icons.colorize,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
