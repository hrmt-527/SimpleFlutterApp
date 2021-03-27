import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MyEmailFieldWidget extends StatefulWidget {
  MyEmailFieldWidget({Key key, this.hint}) : super(key: key);

  final String hint;

  @override
  _MyEmailFieldWidget createState() => _MyEmailFieldWidget();
}

class _MyEmailFieldWidget extends State<MyEmailFieldWidget> {
  @override
  void initState() {
    super.initState();
    print("\n initState");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(200, 50)),
        child: TextFormField(
          validator: (email) {
            if (!EmailValidator.validate(email)) {
              return "Email Wrong";
            }
            return null;
          },
          onChanged: (value) {
            //print("$value");
          },
          onSaved: (String value) {
            //print("$value has been saved " + widget.hint);
          },
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
          showCursor: true,
          cursorRadius: Radius.circular(1.2),
          cursorWidth: 2,
          maxLength: 30,
          maxLengthEnforced: true,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
