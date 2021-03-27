library config.globals;

import 'package:first_app/form_widget.dart';
import 'package:first_app/text_as_link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

var url = " ";
//var response = await http.get(url);
Future<http.Response> fetchNames() {
  return http.get(url);
}

class ThemeChange with ChangeNotifier {
  static bool isDark = false;

  ThemeMode currentTheme() {
    return (isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

ThemeChange obj = ThemeChange();
/*
 for one liner function 
void main() => runApp(MyApp());
*/

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  /*
  @protected
  @factory
  
  State createState();
  
  */
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    obj.addListener(() {
      print("theme changed");
      setState(() {
        print("\n" + obj.currentTheme().toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("\n Init state");
    obj.addListener(() {
      print("theme changed");
      setState(() {
        print("\n" + obj.currentTheme().toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // these both are controlling which theme will be there
      // if theme or darkTheme has been provided
      //theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: obj.currentTheme(),

      home: MyHomePage(title: 'First App'),
    );
  }
}

//---------------------- Main Widgets Child this class is immutable--------------------

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  /*
  @protected
  @factory
  
  State createState();
  
  */
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//------------------------------------------
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }

  // trying to set the state to
  void themeMode() {
    setState(() {
      AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyFormWidget(),
            ElevatedButton(
              onPressed: themeMode,
              child: Text(
                "Change Theme",
              ),
            ),
            MyTextAsLinkWidget(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), */

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
