import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// this the stateful widget i.e. run time changes can be seen here
class MyTextAsLinkWidget extends StatefulWidget {
  MyTextAsLinkWidget({Key? key}) : super(key: key);

  @override
  _MyTextAsLinkWidget createState() => _MyTextAsLinkWidget();
}

// state whic
class _MyTextAsLinkWidget extends State<MyTextAsLinkWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("\n initState TextAsLinkWidget");
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.blueGrey, fontSize: 30),
            children: <TextSpan>[
          TextSpan(
              text: 'By clicking Sign Up, you agree to our ',
              style: TextStyle(fontSize: 10),
              // for two dots : https://dart.dev/guides/language/language-tour#cascade-notation-
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("clicked");
                })
        ]));
  }
}
