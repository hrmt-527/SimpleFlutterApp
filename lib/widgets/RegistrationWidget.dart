import 'package:first_app/email_widget.dart';
import 'package:first_app/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

class MyRegistrationWidget extends StatefulWidget {
  MyRegistrationWidget({Key? key}) : super(key: key);

  @override
  _MyRegistrationWidget createState() => _MyRegistrationWidget();
}

class _MyRegistrationWidget extends State<MyRegistrationWidget> {
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
                  // ToDo: Navigate to appropriate page
                  print("Clicked");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => FirstPage(indexNumber: 0)));
                },
                child: Text("Register")),
          ],
        ));
  }
}
