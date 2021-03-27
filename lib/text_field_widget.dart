import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  MyTextFieldWidget({Key key, this.hint, this.type}) : super(key: key);

  final String hint;
  final TextInputType type;
  @override
  _MyTextFieldWidget createState() => _MyTextFieldWidget();
}

class _MyTextFieldWidget extends State<MyTextFieldWidget> {
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
          validator: (value) {
            if (value.isEmpty) {
              return "Put the value here";
            }
            return null;
          },
          onChanged: (value) {
            // print("$value is changed value");
          },
          onSaved: (String value) {
            //  print("$value has been saved " + widget.hint);
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
          keyboardType: widget.type,
        ),
      ),
    );
  }
}
