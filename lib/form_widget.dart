import 'package:first_app/email_widget.dart';
import 'package:first_app/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:first_app/main_page.dart';

class MyFormWidget extends StatefulWidget {
  MyFormWidget({Key key}) : super(key: key);

  @override
  _MyFormWidget createState() => _MyFormWidget();
}

class _MyFormWidget extends State<MyFormWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("\n initState FormWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        // autovalidation
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: Column(
          children: <Widget>[
            MyTextFieldWidget(
              hint: "Username",
            ),
            MyEmailFieldWidget(
              hint: "Email",
            ),
            MyTextFieldWidget(
              hint: "Password",
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(indexNumber: 0)));
                },
                child: Text("Register")),
          ],
        ));
  }
}
